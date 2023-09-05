Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB07DDD1
	for <timestamp@lists.linux.dev>; Tue,  5 Sep 2023 18:53:37 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-401da71b7c5so28350845e9.2
        for <timestamp@lists.linux.dev>; Tue, 05 Sep 2023 11:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1693940016; x=1694544816; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gD8mhbYtSpsp4MugkXhi33yXQT05nfWNxdtLBId4RL8=;
        b=F/+gN9qy1gxPTyA8GynKKSrFBTLjETPR8Xw7ygtTr5mvQRTwjjexR4f1j4hLs+2Vy7
         FyMc4FSp7mxzjhdKBvjcxZocw4jHrpwix031sdzW3mmXmlbh8xY328DU6Z+tkqvtU8eq
         oWpDi7HKnGg9EQRdgpbU53ecrtKWB8Gy+J8la0qYIvTeGX4uNE55vlj1ZUuS6TwKd8By
         zTYXF7jWbp1QuHxzCs28BKMcV5dx8XlmTyQBm7BzE+N9od5osN2p+zcRz9Jhuas9ldEz
         7tSnhlksQ5CwA4wGZgBfhuzEbms03Ffn9GlYecw7OhpRJIesqxSTiT78g1STCzRVU9zp
         JpOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693940016; x=1694544816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gD8mhbYtSpsp4MugkXhi33yXQT05nfWNxdtLBId4RL8=;
        b=MfytPKMoeSC9LU8XPnox+EWIBXOiwQ3IItgGda2fQc9QhYtTPdnT6FuvStuDaaVPzO
         X+Xo2iz3R7dhgOvsDMnT5d90bkJr7S1KEQM/RyVTZFSUos5+7yjfvJ7j+dWMcP8fxUVK
         3nf+bElGD2Un+DkFJf2tKLX3yVpJ+6pkp1d6qHywMaRZyixqjK+LpJ6S+JFTZHFCxgm7
         jbV7smA0Z1lKgn2dwmjRLXRKSo5OBje7gn5zlzrTFz2y28ilrHke6Ruk9VOMis+ZzFQH
         +810ePN6LdMT2Evz5jSDh9eP0UxpyAvNpG+GqVmvFT4S/9+XxWGRsysdxo6p41YoDmnJ
         /78w==
X-Gm-Message-State: AOJu0YwntzeN2qwqXmEY6UHP4Kj1D3n1HRmvie6HYcuqEz9Ljl8wGXhu
	SIDVakyey4v9quqfGV/vvwsr/A==
X-Google-Smtp-Source: AGHT+IFIMVvhNg464qJima4kezuYWuRmRs+hpxgOQnc+URZYC5BvtqpinR7GN44km7chTJtWGj8fDQ==
X-Received: by 2002:a7b:c390:0:b0:401:38dc:8918 with SMTP id s16-20020a7bc390000000b0040138dc8918mr481515wmj.24.1693940015869;
        Tue, 05 Sep 2023 11:53:35 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7a54:5dbc:6d09:48b7])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c249100b003fbc30825fbsm17550010wms.39.2023.09.05.11.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 11:53:35 -0700 (PDT)
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
Subject: [PATCH 08/21] gpio: acpi: provide acpi_gpio_device_free_interrupts()
Date: Tue,  5 Sep 2023 20:52:56 +0200
Message-Id: <20230905185309.131295-9-brgl@bgdev.pl>
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

We're moving away from public functions that take struct gpio_chip as
argument as the chip - unlike struct gpio_device - is owned by its
provider and tied to its lifetime.

Provide an alternative to acpi_gpiochip_free_interrupts().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-acpi.c | 29 +++++++++++++++++++++++------
 include/linux/gpio/driver.h | 12 ++++++++++++
 2 files changed, 35 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index fbda452fb4d6..5633e39396bc 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -558,12 +558,9 @@ void acpi_gpiochip_request_interrupts(struct gpio_chip *chip)
 }
 EXPORT_SYMBOL_GPL(acpi_gpiochip_request_interrupts);
 
-/**
- * acpi_gpiochip_free_interrupts() - Free GPIO ACPI event interrupts.
- * @chip:      GPIO chip
- *
- * Free interrupts associated with GPIO ACPI event method for the given
- * GPIO chip.
+/*
+ * This function is deprecated, use acpi_gpio_device_free_interrupts()
+ * instead.
  */
 void acpi_gpiochip_free_interrupts(struct gpio_chip *chip)
 {
@@ -604,6 +601,26 @@ void acpi_gpiochip_free_interrupts(struct gpio_chip *chip)
 }
 EXPORT_SYMBOL_GPL(acpi_gpiochip_free_interrupts);
 
+/**
+ * acpi_gpio_device_free_interrupts() - Free GPIO ACPI event interrupts.
+ * @chip	GPIO device
+ *
+ * Free interrupts associated with GPIO ACPI event method for the given
+ * GPIO device.
+ */
+void acpi_gpio_device_free_interrupts(struct gpio_device *gdev)
+{
+	struct gpio_chip *gc;
+
+	/* TODO: protect gdev->chip once SRCU is in place in GPIOLIB. */
+	gc = gdev->chip;
+	if (!gc)
+		return;
+
+	acpi_gpiochip_free_interrupts(gc);
+}
+EXPORT_SYMBOL_GPL(acpi_gpio_device_free_interrupts);
+
 int acpi_dev_add_driver_gpios(struct acpi_device *adev,
 			      const struct acpi_gpio_mapping *gpios)
 {
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index b68b3493b29d..47906bc56b3d 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -835,4 +835,16 @@ static inline struct fwnode_handle *gpiochip_node_get_first(struct device *dev)
 	return NULL;
 }
 
+/*
+ * FIXME: Remove this once the only driver that uses it - android tablets -
+ * becomes a good citizen and stops abusing GPIOLIB.
+ */
+#ifdef CONFIG_ACPI
+void acpi_gpio_device_free_interrupts(struct gpio_device *gdev);
+#else
+static inline void acpi_gpio_device_free_interrupts(struct gpio_device *gdev)
+{
+}
+#endif
+
 #endif /* __LINUX_GPIO_DRIVER_H */
-- 
2.39.2

