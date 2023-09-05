Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F112DDDAF
	for <timestamp@lists.linux.dev>; Tue,  5 Sep 2023 18:53:38 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4018af103bcso1013175e9.1
        for <timestamp@lists.linux.dev>; Tue, 05 Sep 2023 11:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1693940017; x=1694544817; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LktKQq4MWoQ/qKoiT9d7DgSnCPQ1kCPUYmKK3IZgeGM=;
        b=1JRALQ7xKeopXqVfclTrmaRVanui1a2+ZlwvD1Qyd03UgZzZLLlUO7CSaLt3J1dV6a
         7Il4BiTFOSzFlEVE22hDxpnyD7AEVjNBnvnG0tOnnROuPcCkNeKRyf24EXMFvNkvA008
         N9CX4xVb0p3CYHv12RH5qHcri/nEMjFMzoJRItSizwRDRAqFkLVeQU9fvMB71gA9uJQW
         +pgDNBJUYcuu/aD/VX8bNLDEbp2x7B+/VNlgXS+4A6N5ZjCg1+3lXywvGiSahax0mKbR
         1QLheEuvpHBfHlM+umGd+aw3x8Ezmcd/tUlwp1yKFZLggGzwI5M1Buk5mZ2d2+/TcLGn
         QGSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693940017; x=1694544817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LktKQq4MWoQ/qKoiT9d7DgSnCPQ1kCPUYmKK3IZgeGM=;
        b=BgfRDxofQd5VStvwMOlDGONJ35o1x9H05YVRNDlEf+SOIuWjvQ8o1mBXQvS+j0uIve
         DRNuPDmEhlhBOemSNlOYBqMp0T/BI9T/dZILzHiq6TncwktQp0bGZH65fyRqEcNYmN2i
         EAByApT3Lh3rWeYYePMo7yVXQFHrEGl9/lrXq3sQcqymeWqQLKFZQjFGMCltbKDi2xtG
         iNVQTGggT2Yk+6m/4ZejH2yj96R8ouHdbp+dUqSbJIT+uzyG5EV/4Sls/2BW1qfX/va7
         pOONUxZ/JUJNfIThB4Uv41V1578kOJ0yf5DZ7xW3BbQrhXDceYV9oIwLv2KC2ZOpTVt+
         bFXA==
X-Gm-Message-State: AOJu0Yz04B3VS7rx94yHDEpIofnZ0vEMVN8wkFhXWstmNUVGrHF71R4c
	opAeEQxTxjmWx+nEIQgD3ORsjA==
X-Google-Smtp-Source: AGHT+IEKE+XCvxCtmXJO+rvvHv5Ifn1+auM+4ZurnpxJ8t+aLjhMPMETigx/CB4V/gfiHQTOepYw2A==
X-Received: by 2002:a05:600c:4b1f:b0:401:bcec:be3e with SMTP id i31-20020a05600c4b1f00b00401bcecbe3emr598796wmp.17.1693940017155;
        Tue, 05 Sep 2023 11:53:37 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7a54:5dbc:6d09:48b7])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c249100b003fbc30825fbsm17550010wms.39.2023.09.05.11.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 11:53:36 -0700 (PDT)
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
Subject: [PATCH 09/21] gpiolib: reluctantly provide gpio_device_get_chip()
Date: Tue,  5 Sep 2023 20:52:57 +0200
Message-Id: <20230905185309.131295-10-brgl@bgdev.pl>
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

The process of converting all unauthorized users of struct gpio_chip to
using dedicated struct gpio_device function will be long so in the
meantime we must provide a way of retrieving the pointer to struct
gpio_chip from a GPIO device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c      | 18 ++++++++++++++++++
 include/linux/gpio/driver.h |  1 +
 2 files changed, 19 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 9715bbc698e9..408f8a7753f9 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -246,6 +246,24 @@ int gpio_device_get_base(struct gpio_device *gdev)
 }
 EXPORT_SYMBOL_GPL(gpio_device_get_base);
 
+/**
+ * gpio_device_get_chip() - Get the gpio_chip implementation of this GPIO device
+ * @gdev: GPIO device
+ *
+ * Until we can get rid of all non-driver users struct gpio_chip, we must
+ * provide a way of retrieving the pointer to it from struct gpio_device. This
+ * is *NOT* safe as the GPIO API is considered to be hot-unpluggable and the
+ * chip can dissapear at any moment (unlike reference-counted struct
+ * gpio_device).
+ *
+ * Use at your own risk.
+ */
+struct gpio_chip *gpio_device_get_chip(struct gpio_device *gdev)
+{
+	return gdev->chip;
+}
+EXPORT_SYMBOL_GPL(gpio_device_get_chip);
+
 /* dynamic allocation of GPIOs, e.g. on a hotplugged device */
 static int gpiochip_find_base(int ngpio)
 {
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 47906bc56b3d..bb9ec741bfda 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -782,6 +782,7 @@ struct gpio_device *gpiod_to_device(struct gpio_desc *desc);
 
 /* struct gpio_device getters */
 int gpio_device_get_base(struct gpio_device *gdev);
+struct gpio_chip *gpio_device_get_chip(struct gpio_device *gdev);
 
 #else /* CONFIG_GPIOLIB */
 
-- 
2.39.2

