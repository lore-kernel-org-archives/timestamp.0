Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38B7DDD1
	for <timestamp@lists.linux.dev>; Tue,  5 Sep 2023 18:53:49 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-401b5516104so28223815e9.2
        for <timestamp@lists.linux.dev>; Tue, 05 Sep 2023 11:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1693940028; x=1694544828; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v8EoAIqFLJCxUpfLhsvBV4jgy9F1vQzmq/NZ2XWmhPM=;
        b=uljGOybf+naz1wCmX9UwN2K7I6Nc9D93H1K3AB4DgA6mvUROirEmYY5RHecx9uMJH/
         3EqPdpczlzXE6FnqGYOQHqbRDQdfrTsofoKlRxPfUeFNl0xwZ39XPHiRWtDRpUGONf8B
         vsdVjoAV97QsP44otiwlL/TgGyj07HsrbuKw0Pe93uN6byPa5qIL2DVNMMCpxEEdx5p2
         wMEWVkkj3l+tzke4RVuu6UBuoq5O/NF3NuEv0qaoQOdChWnjR450bJ5VTzZwH6NgRc2j
         gpoLS/82kcpXz74noEkyLa3dg0w0Zmt4Z7ybtp3e4g4u0N4BH3PGH3pBbi1i3vXxJ2Um
         diMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693940028; x=1694544828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v8EoAIqFLJCxUpfLhsvBV4jgy9F1vQzmq/NZ2XWmhPM=;
        b=O0GUPK47zihscbC2CwkAgZq8bChlK9GXkb4IVJ1E/qR1yspdLnb2aqofMbxzHthZ58
         UnvDNumHdUjeFg3nZy0DDEgX7uvMdoZD6PxLDr+5faxwm6OXHoDnvLDRXEokqXhM4kRm
         rgx+1sYdvbTvObal6oZQhs5LVPzd8VbaEKmiccpG9mg2DMNzI082wwS/3t+ecCjxrCfT
         0qvxYfTd03B/7NPt2jC6CnDQI2LaFNh8Cm8rt2BaIGxxTi2M0+IUc/8Apl219oQr7ni/
         uNbaUyd9M24Pju6Y8QXK31t8PKmd77KW77vhw3MDjqztqtPzrNfiwfdEZYWdBqOM5qcw
         BYYQ==
X-Gm-Message-State: AOJu0YzZ2ISLpzW9WpGKRZHPRgdcC5eUliDbxxQ9FDjbqvVAksVE+R63
	W8NfTWINUteR/65h1TMvT69PdQ==
X-Google-Smtp-Source: AGHT+IGdmweLsvxMkviAD6X4Rb7LNMdeCjqz2Ypd3y+SG6ZL6d4+T9L7pYZxfgxQTgv+RGIUJmtJEw==
X-Received: by 2002:a05:600c:2809:b0:3fe:dcd0:2e10 with SMTP id m9-20020a05600c280900b003fedcd02e10mr472155wmb.17.1693940027944;
        Tue, 05 Sep 2023 11:53:47 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7a54:5dbc:6d09:48b7])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c249100b003fbc30825fbsm17550010wms.39.2023.09.05.11.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 11:53:47 -0700 (PDT)
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
Subject: [PATCH 18/21] gpio: acpi: replace gpiochip_find() with gpio_device_find()
Date: Tue,  5 Sep 2023 20:53:06 +0200
Message-Id: <20230905185309.131295-19-brgl@bgdev.pl>
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

We're porting all users of gpiochip_find() to using gpio_device_find().
Update the ACPI GPIO code.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-acpi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index 5633e39396bc..15d3350123d9 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -143,7 +143,7 @@ static int acpi_gpiochip_find(struct gpio_chip *gc, void *data)
  */
 static struct gpio_desc *acpi_get_gpiod(char *path, unsigned int pin)
 {
-	struct gpio_chip *chip;
+	struct gpio_device *gdev __free(gpio_device_put) = NULL;
 	acpi_handle handle;
 	acpi_status status;
 
@@ -151,11 +151,11 @@ static struct gpio_desc *acpi_get_gpiod(char *path, unsigned int pin)
 	if (ACPI_FAILURE(status))
 		return ERR_PTR(-ENODEV);
 
-	chip = gpiochip_find(handle, acpi_gpiochip_find);
-	if (!chip)
+	gdev = gpio_device_find(handle, acpi_gpiochip_find);
+	if (!gdev)
 		return ERR_PTR(-EPROBE_DEFER);
 
-	return gpiochip_get_desc(chip, pin);
+	return gpiochip_get_desc(gdev->chip, pin);
 }
 
 /**
-- 
2.39.2

