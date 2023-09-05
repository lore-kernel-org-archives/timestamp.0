Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59917D53B
	for <timestamp@lists.linux.dev>; Tue,  5 Sep 2023 18:53:35 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-401bbfc05fcso30009055e9.3
        for <timestamp@lists.linux.dev>; Tue, 05 Sep 2023 11:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1693940013; x=1694544813; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rGZDmwAMqeUVhOTfv7ZtpSGAuFAAm5HZQ+raVbVaSso=;
        b=ahPed7en1h61Zq6GHOCnHc0Dn/7mhkObkeKv6N8dMVMmaJ0MwgnfhT1MJSb8RtkuH2
         r1b0wcVmMytUQTmEPdBJPW523iffUU+1xyQdqFmmKI5rp3Nwr97IQGSJdbw6l47WHNk1
         CSpAAi6H+RLYETjiE4rwZ0+NWkG8OWviaBZ6qHI2GteRnPAtVBsrhSkcLcfpKqdrqzLc
         XxIDlynNJs+ypNBh7ziTQfEBPO/jzr7KsaEBXsooLIul9pSL3MN6Cu1FWylpFTDX5Umf
         ixnJkoD6TVJ063ADRMwywWDke8ienojUQc4+VAfQGNgoIaK61SPbt5SwJ1CKQjt+4NS4
         Pf2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693940013; x=1694544813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rGZDmwAMqeUVhOTfv7ZtpSGAuFAAm5HZQ+raVbVaSso=;
        b=Sd65v88Moq26v/IwRdQnxljxg/LgxccFfgl0DrJYlOgRo7xcqEwBNlzztb/pBe+Dnq
         pP+eSCG8Wtx3BGC2rwvFmZ/oSCJBMNP/VnD4cyrvByyB4kA60kNomGyEBWHLxS7vpmDo
         0ty+/FQFntHAyFdMrMSgZSc446Rj0L+AcHYmgqux1pjyIGqy+D+ogvmkwtFIwzHimf1r
         ehC4TmHpDVbp9WXhcVGxTvdyQQxOaGDfeZPii3rU2ev9bcKPVH8afPMUnQKhiNFsgATL
         0Bb3/yBMr+w1rGtzYlel6hV3CixqE+uiH+tb59atUZuOVYt/TPqhNHBP8i3vSl1xyD0e
         XxEg==
X-Gm-Message-State: AOJu0YzR7Mb20Q0Ccqm5OJnlZD/QobUPepgTGjbpnYAmIBbJsKBCT4p0
	Vofm9kW5yl9QkKnCUimsXlWI0Q==
X-Google-Smtp-Source: AGHT+IE6a92Y8/0xOq//9BYLFPzr9xAdeK40uWCbwfh4Inevy5jL9Qx5QtQIzqIf7nl+RNMdD6lXWg==
X-Received: by 2002:a05:600c:2149:b0:402:8c7b:ceea with SMTP id v9-20020a05600c214900b004028c7bceeamr402336wml.30.1693940013467;
        Tue, 05 Sep 2023 11:53:33 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7a54:5dbc:6d09:48b7])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c249100b003fbc30825fbsm17550010wms.39.2023.09.05.11.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 11:53:33 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Dipen Patel <dipenp@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Mark Gross <markgross@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	timestamp@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 06/21] gpiolib: provide gpiod_to_device()
Date: Tue,  5 Sep 2023 20:52:54 +0200
Message-Id: <20230905185309.131295-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230905185309.131295-1-brgl@bgdev.pl>
References: <20230905185309.131295-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_desc is opaque so provide a way for users to retrieve the
underlying GPIO device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c      | 14 ++++++++++++++
 include/linux/gpio/driver.h |  1 +
 2 files changed, 15 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 4a9af6bfc6d4..9637a79a9a60 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -219,6 +219,20 @@ struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc)
 }
 EXPORT_SYMBOL_GPL(gpiod_to_chip);
 
+/**
+ * gpiod_to_device() - Return the GPIO device owning this descriptor
+ * @desc: GPIO descriptor
+ *
+ * Returns:
+ * Pointer to the opaque struct gpio_device object. This function does not
+ * increase the reference count of gpio_device.
+ */
+struct gpio_device *gpiod_to_device(struct gpio_desc *desc)
+{
+	return gpio_device_get(desc->gdev);
+}
+EXPORT_SYMBOL_GPL(gpiod_to_device);
+
 /* dynamic allocation of GPIOs, e.g. on a hotplugged device */
 static int gpiochip_find_base(int ngpio)
 {
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index b2572b26c8e3..e3747e730ed1 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -778,6 +778,7 @@ int gpiochip_lock_as_irq(struct gpio_chip *gc, unsigned int offset);
 void gpiochip_unlock_as_irq(struct gpio_chip *gc, unsigned int offset);
 
 struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc);
+struct gpio_device *gpiod_to_device(struct gpio_desc *desc);
 
 #else /* CONFIG_GPIOLIB */
 
-- 
2.39.2

