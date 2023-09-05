Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874FADDAF
	for <timestamp@lists.linux.dev>; Tue,  5 Sep 2023 18:53:36 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-402c46c49f4so28186375e9.1
        for <timestamp@lists.linux.dev>; Tue, 05 Sep 2023 11:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1693940014; x=1694544814; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2+MC7OlTYjYmYcid9pUzzxXRyDGKxkUAmb4nz8uCexs=;
        b=lEqCbL7iD7Zcv7QPVts7SZcW4AU29OXHZstacH1BwzSGFhNYrHYPeYjGvkar82jrxF
         mJMVgooulvNos8cGXpngmxZEZJfASQoGZcW/j9mSVAZ0dlDf0gfARbEgSP1ipT36Eo9d
         bM0cO7oPLx07yBsAl0ZQmELkZllnvQJJPHqqtNMB0IJ/DdQsFL2CO0mUOOZXO0R+Uk84
         hR2f+6X91bOtMYXH9qbsL5CbfIk4e9JGf7BgSc5JVeO5Pc0xm4IBz3LlBr4+kjJL+4vq
         VUB51EHW5Rig+uJhsYkXlGn8uEY2603UfO7IcFTflZDcVZINi6v/WtwWl+JHhNlrYwAF
         pc1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693940014; x=1694544814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2+MC7OlTYjYmYcid9pUzzxXRyDGKxkUAmb4nz8uCexs=;
        b=WpiFzlArnalOedYc7dVYa8Ti9BkWmwwl5sPUiVeGkpgWYHGovl4ESObL1lo3mTbP8C
         dvtDQfgvwiFOw4Epv3ZjVqz2yL+2mqTlWJyeYJDB5zSsPqjYQ1Tc1r8VvlK5GcPInw++
         0Dses1wbCCxDuK0h40ZZr7gAtk5enkDsxbL0phROku/VERWHx90zSXx4I1CqtnxQFuHy
         G3bHhlmsoUHmugXaEraTBcL6zrxTjLGYDjn2H4Y0VRe0DCG5YpKmTLXGjI3wATE9NZXl
         JyPArbCKTpF2y7uz6+yxnVqmgFLBoJemXgHFyJ/hEE7Y6s5z33ziFHgEvZXdly4rHF/7
         Wa9A==
X-Gm-Message-State: AOJu0Yx5Zif//FxQ79tIT7teUwFPmPVttqMApUgJHAEBt5pWXg9ZEPDZ
	LqZ53qnVNhk9yn5SbFrFMBQCZg==
X-Google-Smtp-Source: AGHT+IGj2EuAvHtXRXD8rdSvHdyQNmCzp7/4dD7j6aPqgw+n/kXSu9aLQQjPpRIFRE646UdFzsOLag==
X-Received: by 2002:adf:e0c5:0:b0:319:6b6c:dd01 with SMTP id m5-20020adfe0c5000000b003196b6cdd01mr477303wri.17.1693940014702;
        Tue, 05 Sep 2023 11:53:34 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7a54:5dbc:6d09:48b7])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c249100b003fbc30825fbsm17550010wms.39.2023.09.05.11.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 11:53:34 -0700 (PDT)
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
Subject: [PATCH 07/21] gpiolib: provide gpio_device_get_base()
Date: Tue,  5 Sep 2023 20:52:55 +0200
Message-Id: <20230905185309.131295-8-brgl@bgdev.pl>
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

Let's start adding getters for the opaque struct gpio_device. Start with
a function allowing to retrieve the base GPIO number.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c      | 13 +++++++++++++
 include/linux/gpio/driver.h |  3 +++
 2 files changed, 16 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 9637a79a9a60..9715bbc698e9 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -233,6 +233,19 @@ struct gpio_device *gpiod_to_device(struct gpio_desc *desc)
 }
 EXPORT_SYMBOL_GPL(gpiod_to_device);
 
+/**
+ * gpio_device_get_base() - Get the base GPIO number allocated by this device
+ * @gdev: GPIO device
+ *
+ * Returns:
+ * First GPIO number in the global GPIO numberspace for this device.
+ */
+int gpio_device_get_base(struct gpio_device *gdev)
+{
+	return gdev->base;
+}
+EXPORT_SYMBOL_GPL(gpio_device_get_base);
+
 /* dynamic allocation of GPIOs, e.g. on a hotplugged device */
 static int gpiochip_find_base(int ngpio)
 {
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index e3747e730ed1..b68b3493b29d 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -780,6 +780,9 @@ void gpiochip_unlock_as_irq(struct gpio_chip *gc, unsigned int offset);
 struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc);
 struct gpio_device *gpiod_to_device(struct gpio_desc *desc);
 
+/* struct gpio_device getters */
+int gpio_device_get_base(struct gpio_device *gdev);
+
 #else /* CONFIG_GPIOLIB */
 
 #include <linux/err.h>
-- 
2.39.2

