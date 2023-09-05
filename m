Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327ADDDAF
	for <timestamp@lists.linux.dev>; Tue,  5 Sep 2023 18:53:45 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-31dd10c2b8bso2382300f8f.3
        for <timestamp@lists.linux.dev>; Tue, 05 Sep 2023 11:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1693940024; x=1694544824; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gFpxyOwy5Bm9Qt9hRSpXKADqH+X+nrhUxL/zhVP0yhY=;
        b=spo2Qx4TUqcf3qftBdXsDoxmsZkx87SdMbi5FBEDU4pC7PUhx9JSoZcX1lexEPr+1J
         7zXjcor5MgCzLJKySQbak02WpbNsvQVtWw8DR4Ve+FM17vEypGOL72+netUl+7rmL5bx
         XatSJQOSpw+VqnWPzXc05ozfmORq57xM7mEOs1AbgpISmD34hCuP5ev4JWCGgOauIIfj
         608TnPpEgDEs00Yx7Yct6AIIPSO0QQIKqdG44NfNa1Ganyk36v/L9whF8TD2UGqoDlBj
         j9E0WJOHjb0zxZtiI+bfqrSnhrQUmGAdh4wjZouicFcDU0zmQCPLRVVuBXBH8CJUxcvu
         1MfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693940024; x=1694544824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gFpxyOwy5Bm9Qt9hRSpXKADqH+X+nrhUxL/zhVP0yhY=;
        b=BoywGxl59N+agPx9oW4ccyGJVejIu12THKFtHsrsUADQwzg6fD47stdoopL/eppoTU
         gRsvvPM0BY6w4qZdDtQzsBfdukzfwKv3UUOqtxPovx4H2a+7frk2rC028VDFlrCovkWm
         Hi7e+WaNsRtsT/g32fdPywxIHbGTMZTa3nkOgtbW9ct6ZlrVkwHC7bFFLIkHFN2k1/gM
         rIFrzPecuj67Id0Ets9+HBnTiV/2K091nxG7wQVAFNaK0mXRgl/WGI6qzaEqr3P67kB/
         eYKd3q3sYrIqePhyKQcDwasCl1hAbvrtxUnhAXlv/dwZUp04DnqhfYckM5Of8UEQ5K1n
         QEqw==
X-Gm-Message-State: AOJu0Yy3tJ4iHisJfKY+xi4TV5IjFdsz8jCUKErVCs+CU6XHUu9oMkrH
	eqjO0Rqult3pCNFvjy4TEfpWEQ==
X-Google-Smtp-Source: AGHT+IFRNQIOeT3zr09E3n7bBEGrta/pNu8Vff14KdMD6sxtlr9ZDhLyFMZ76FUBno0gzmLiwhMBVA==
X-Received: by 2002:a5d:5592:0:b0:317:54de:9719 with SMTP id i18-20020a5d5592000000b0031754de9719mr425005wrv.70.1693940024276;
        Tue, 05 Sep 2023 11:53:44 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7a54:5dbc:6d09:48b7])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c249100b003fbc30825fbsm17550010wms.39.2023.09.05.11.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 11:53:43 -0700 (PDT)
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
Subject: [RFT PATCH 15/21] arm: omap1: ams-delta: stop using gpiochip_find()
Date: Tue,  5 Sep 2023 20:53:03 +0200
Message-Id: <20230905185309.131295-16-brgl@bgdev.pl>
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

gpiochip_find() is going away as it's not hot-unplug safe. This platform
is not affected by any of the related problems as this GPIO controller
cannot really go away but in order to finally remove this function, we
need to convert it to using gpio_device_find() as well.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm/mach-omap1/board-ams-delta.c | 36 +++++++++++++--------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/arch/arm/mach-omap1/board-ams-delta.c b/arch/arm/mach-omap1/board-ams-delta.c
index 9808cd27e2cf..a28ea6ac1eba 100644
--- a/arch/arm/mach-omap1/board-ams-delta.c
+++ b/arch/arm/mach-omap1/board-ams-delta.c
@@ -560,22 +560,6 @@ static struct gpiod_lookup_table *ams_delta_gpio_tables[] __initdata = {
 	&ams_delta_nand_gpio_table,
 };
 
-/*
- * Some drivers may not use GPIO lookup tables but need to be provided
- * with GPIO numbers.  The same applies to GPIO based IRQ lines - some
- * drivers may even not use GPIO layer but expect just IRQ numbers.
- * We could either define GPIO lookup tables then use them on behalf
- * of those devices, or we can use GPIO driver level methods for
- * identification of GPIO and IRQ numbers. For the purpose of the latter,
- * defina a helper function which identifies GPIO chips by their labels.
- */
-static int gpiochip_match_by_label(struct gpio_chip *chip, void *data)
-{
-	char *label = data;
-
-	return !strcmp(label, chip->label);
-}
-
 static struct gpiod_hog ams_delta_gpio_hogs[] = {
 	GPIO_HOG(LATCH2_LABEL, LATCH2_PIN_KEYBRD_DATAOUT, "keybrd_dataout",
 		 GPIO_ACTIVE_HIGH, GPIOD_OUT_LOW),
@@ -615,14 +599,28 @@ static void __init modem_assign_irq(struct gpio_chip *chip)
  */
 static void __init omap_gpio_deps_init(void)
 {
+	struct gpio_device *gdev;
 	struct gpio_chip *chip;
 
-	chip = gpiochip_find(OMAP_GPIO_LABEL, gpiochip_match_by_label);
-	if (!chip) {
-		pr_err("%s: OMAP GPIO chip not found\n", __func__);
+	/*
+	 * Some drivers may not use GPIO lookup tables but need to be provided
+	 * with GPIO numbers. The same applies to GPIO based IRQ lines - some
+	 * drivers may even not use GPIO layer but expect just IRQ numbers.
+	 * We could either define GPIO lookup tables then use them on behalf
+	 * of those devices, or we can use GPIO driver level methods for
+	 * identification of GPIO and IRQ numbers.
+	 *
+	 * This reference will be leaked but that's alright as this device
+	 * never goes down.
+	 */
+	gdev = gpio_device_find_by_label(OMAP_GPIO_LABEL);
+	if (!gdev) {
+		pr_err("%s: OMAP GPIO device not found\n", __func__);
 		return;
 	}
 
+	chip = gpio_device_get_chip(gdev);
+
 	/*
 	 * Start with FIQ initialization as it may have to request
 	 * and release successfully each OMAP GPIO pin in turn.
-- 
2.39.2

