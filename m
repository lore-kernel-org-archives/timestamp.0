Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16381DDD1
	for <timestamp@lists.linux.dev>; Tue,  5 Sep 2023 18:53:52 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-401b5516104so28224195e9.2
        for <timestamp@lists.linux.dev>; Tue, 05 Sep 2023 11:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1693940030; x=1694544830; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y08y4soco06KI/f6qh6fDW5G+nl2ifTZ323XD3WrKbY=;
        b=VM0lXCTpiqUYMKc+0/+we4WmilbegNJC9eGmx2QnO3eH+KI0FP8200Cm6nxC6wXRjj
         F4HGQj1nCXRG+BXqfnPPbT0Pil89S30npQyLqj1qeRi3Sf4iF2xfO810Z4+ahh2Xg/GT
         Dfl+cexF33MnZ0uX/KDalYoq+LfoArQQ+8nRhFB4yq+wja5u6yPrK+C3N6FsSur8DYEz
         Tb9IeUWyPLT8BZciQ/tBxXgdzPrzBZ9DwJMX456DpGvYThRaoshOYwbfSVGNON+FSmaJ
         s88FyxXkyGEjKuhF900nG2lNRoGLgUBMrnuGQVUtvkumHk39DN0iqzsTusTtuWayY/02
         R+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693940030; x=1694544830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y08y4soco06KI/f6qh6fDW5G+nl2ifTZ323XD3WrKbY=;
        b=OJj8jfmnCpfccz8owk5p8cwlhcKrXj9/nzywofgjlPrRkCFXGUCdDSUvUhi6e53XTx
         D22jtffhQqBDflQ/kSeqvQWt2+CihvWuI6TmJLGNb2Y+P4qUzu/k732gdqv2vDu4DPz6
         VWkx8yiTEwFCsyy5f684p53a7HYeWcmXzbQkGsJh7DzPXpjkrTuelUYxAFwIz9mfqBBg
         ibnmmcykVhp9hpnsdSNzcspeToFH8C5VA+7+aDZ7+cJFge9p7RqSgRckbLs6OCj8tPFQ
         iZjbzfXIVkAs6A0ohQKmsMJ1tEOAzugYwesVAhRS7lpu0DlAZTC2B50Gy4ZLLEV/s0oP
         Z5QA==
X-Gm-Message-State: AOJu0YyxcvSWL0oIS0oHZ3KQf+EZjO8BzWhQee2XoR0f5ha/3sSOlTrp
	f7mAU5Kf+xklb68cuPEZp4iJvA==
X-Google-Smtp-Source: AGHT+IEgNpZG6hg0L74CESnSvpfFz6XeLAbhQH8cNkX0kwXYqx/uTGgV7V6lKbCtezy+q5QbzDETKg==
X-Received: by 2002:a05:600c:21cd:b0:401:38dc:8916 with SMTP id x13-20020a05600c21cd00b0040138dc8916mr474754wmj.10.1693940030455;
        Tue, 05 Sep 2023 11:53:50 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7a54:5dbc:6d09:48b7])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c249100b003fbc30825fbsm17550010wms.39.2023.09.05.11.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 11:53:49 -0700 (PDT)
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
Subject: [PATCH 20/21] gpio: sysfs: drop the mention of gpiochip_find() from sysfs code
Date: Tue,  5 Sep 2023 20:53:08 +0200
Message-Id: <20230905185309.131295-21-brgl@bgdev.pl>
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

We have removed all callers of gpiochip_find() so don't mention it in
gpiolib-sysfs.c.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-sysfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 50503a4525eb..6f309a3b2d9a 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -814,7 +814,7 @@ static int __init gpiolib_sysfs_init(void)
 		 * gpiochip_sysfs_register() acquires a mutex. This is unsafe
 		 * and needs to be fixed.
 		 *
-		 * Also it would be nice to use gpiochip_find() here so we
+		 * Also it would be nice to use gpio_device_find() here so we
 		 * can keep gpio_chips local to gpiolib.c, but the yield of
 		 * gpio_lock prevents us from doing this.
 		 */
-- 
2.39.2

