Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08A6236429
	for <timestamp@lists.linux.dev>; Thu,  6 Feb 2025 14:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738852648; cv=none; b=ZR3kB5nmOGVZZ4HPYGTmTOSitgIs3ZrPFvYDgqu/E9XgL+0wB28c55fPSB+FCF2tXmYTwcLJp9yYeiLxuN7AZJsP6gQYhBwO5+kr36VPb/xkgCs7YjKwIzC1D8+6M2BzMlRZCsMB4yojJ3ccH/DhQqsp713QPPrVOXM55xfUGw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738852648; c=relaxed/simple;
	bh=cWW9uaj5btARuTOtAzQ7Ntg5bsR34Hrv1hOCWz5pJfk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ru9QJVfR7ao2/HX1f2ABbS4bWbgqPJlxRMeH98BCGdFAer2Gfyoh6jEkZymO6hn0B0SLjf7jGps3ibOJr5ywot6DItgcQ0HiV2/Uip7oiATE98JkwuA/zO0aXFc0DbzZCGSa+L/PnyuGCbupUzyNn3o9kkzUoD7g9bZ0xAYZ6G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=yDSpi3cF; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="yDSpi3cF"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-435f8f29f8aso7055785e9.2
        for <timestamp@lists.linux.dev>; Thu, 06 Feb 2025 06:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738852643; x=1739457443; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NF98C5d2ZTnvdUxMyQwmWIlQzv8/8YoukSIjQ9ItWNU=;
        b=yDSpi3cFSyfjgVYb83X8gkkV8t23/sjT/7pnUDOnCSdE4covGCngj5yP1kGF9K4WKx
         mQrXgXB9yCgjY5myPKbRMUak0POOT7HTS8wcOW13cDSNk1c1fz+SPTzHoBHpq87CO5rB
         Balisob7EjVv68BilOYcADFaLPJZX3hYLL0isJ7RHujWWLLybUm437CpkU5J2XiElbHm
         4ymgKBR0+rm/+vb/1s8cHFgMgSBkzGpkJQ9B/vH3XVFzgGeQCOgrc+5oVVWFaBARc+eg
         DPFYcnkPRneAlfrpDD3Lo/hUDljFEocEx95wp9XSrbsii3UCrGomti3OrfBxWYhIuPld
         hLFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738852643; x=1739457443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NF98C5d2ZTnvdUxMyQwmWIlQzv8/8YoukSIjQ9ItWNU=;
        b=Hycnr6PvmLVgU4IytliLyUd0ATdlM+FJ0KJ1kXJy4BK7gRVWkEBiQOyrzzrUJU3b/8
         mQTGngHC8Kw0mymFbU0Ef9riOEgSJy58pqoAV4sDy4gcYBp9CoRJ1GMQJ9ItBgXcD5+a
         AXNFzbndjzKe/bSqE8aHvWU5fE+1ynTJH8QziDQCKVS9tCo/kq2KxCU2HeyVardPIS8p
         tzO+mGijJC0+lAh/zHQny7or0JJQxu9fQuYZvUhuk4VQnd10rujb2J47GdyjEnTCSzL/
         nUnd4ZQv4a1flNvoIkYQNovp4LGUdKL8cp3QS6xERjOyxvcR5Ioqeig55MRmbH7hohCg
         sAEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdlwQFQXJ8Wf1/nVb9/jZNy57AZ6GgnKo2AJ1cHDRQehuZA1uOyozO+syg9NzfLBMp89xL+q0FYl4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxvyKUxpjM3Qn2IzFhkqXnNBoD4XTseKNWiHeE+JHm05XrFm6IC
	eMg3F+jIxq17F9pVRkmwTgNiTA7KEs8TuzmrXD/L5QJTr/Kznb/0EzfBXS7jeqI=
X-Gm-Gg: ASbGnct9wmbnIu9406iF14CjklokQxAHZPTa2g6pEl4+aiF507Yg5K50iyZ/Cxq6EhT
	DBRAFLxMg9RmpKd62D+HwBXy2B3aXX3dAkSbcOO0Vkglv+lNy/3hOb3R5/Jau8itEH72IsBcE1J
	EbBbpTm0RlxoY2u0LVreoZAJoThTP1AjojHU/SnmzSviioy5QzIuIfhujKDE/2yuNCDunLNTi5X
	wqOHcfn8V81vuGI9BiYEZsf4YdKggIGcwYHtgDYCvb2L3GJlDpXREFnPgpzIF83ux5injLdWQbU
	3U8eSJOj66ZH
X-Google-Smtp-Source: AGHT+IFo/YE/ZtOR+lTWdRiCCfpRQ8d0qEwBCkSp6K2f24hkXXHc1rTYV9AZD/HJU1mRVqh7TuuJCw==
X-Received: by 2002:adf:f38f:0:b0:38d:b283:2c48 with SMTP id ffacd0b85a97d-38db4938a63mr4602821f8f.50.1738852642865;
        Thu, 06 Feb 2025 06:37:22 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:c726:a8e:825:b823])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbdd7e5f9sm1929769f8f.57.2025.02.06.06.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 06:37:22 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Dipen Patel <dipenp@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	timestamp@lists.linux.dev,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] gpiolib: don't build HTE code with CONFIG_HTE disabled
Date: Thu,  6 Feb 2025 15:37:14 +0100
Message-ID: <20250206143714.182230-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Hardware timestamping is only used on tegra186 platforms but we include
the code and export the symbols everywhere. Shrink the binary a bit by
compiling the relevant functions conditionally.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c        |  2 ++
 include/linux/gpio/consumer.h | 36 +++++++++++++++++++++--------------
 2 files changed, 24 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index be3351583508..0f4b31f4a995 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2908,6 +2908,7 @@ int gpiod_direction_output_nonotify(struct gpio_desc *desc, int value)
 	return ret;
 }
 
+#if IS_ENABLED(CONFIG_HTE)
 /**
  * gpiod_enable_hw_timestamp_ns - Enable hardware timestamp in nanoseconds.
  *
@@ -2973,6 +2974,7 @@ int gpiod_disable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags)
 	return ret;
 }
 EXPORT_SYMBOL_GPL(gpiod_disable_hw_timestamp_ns);
+#endif /* CONFIG_HTE */
 
 /**
  * gpiod_set_config - sets @config for a GPIO
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index db2dfbae8edb..2175f62e2178 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -110,8 +110,6 @@ int gpiod_get_direction(struct gpio_desc *desc);
 int gpiod_direction_input(struct gpio_desc *desc);
 int gpiod_direction_output(struct gpio_desc *desc, int value);
 int gpiod_direction_output_raw(struct gpio_desc *desc, int value);
-int gpiod_enable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags);
-int gpiod_disable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags);
 
 /* Value get/set from non-sleeping context */
 int gpiod_get_value(const struct gpio_desc *desc);
@@ -348,18 +346,6 @@ static inline int gpiod_direction_output_raw(struct gpio_desc *desc, int value)
 	WARN_ON(desc);
 	return -ENOSYS;
 }
-static inline int gpiod_enable_hw_timestamp_ns(struct gpio_desc *desc,
-					       unsigned long flags)
-{
-	WARN_ON(desc);
-	return -ENOSYS;
-}
-static inline int gpiod_disable_hw_timestamp_ns(struct gpio_desc *desc,
-						unsigned long flags)
-{
-	WARN_ON(desc);
-	return -ENOSYS;
-}
 static inline int gpiod_get_value(const struct gpio_desc *desc)
 {
 	/* GPIO can never have been requested */
@@ -560,6 +546,28 @@ struct gpio_desc *devm_fwnode_gpiod_get_index(struct device *dev,
 
 #endif /* CONFIG_GPIOLIB */
 
+#if IS_ENABLED(CONFIG_GPIOLIB) && IS_ENABLED(CONFIG_HTE)
+int gpiod_enable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags);
+int gpiod_disable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags);
+#else
+static inline int gpiod_enable_hw_timestamp_ns(struct gpio_desc *desc,
+					       unsigned long flags)
+{
+#if !IS_ENABLED(CONFIG_GPIOLIB)
+	WARN_ON(desc);
+#endif
+	return -ENOSYS;
+}
+static inline int gpiod_disable_hw_timestamp_ns(struct gpio_desc *desc,
+						unsigned long flags)
+{
+#if !IS_ENABLED(CONFIG_GPIOLIB)
+	WARN_ON(desc);
+#endif
+	return -ENOSYS;
+}
+#endif /* CONFIG_GPIOLIB && CONFIG_HTE */
+
 static inline
 struct gpio_desc *devm_fwnode_gpiod_get(struct device *dev,
 					struct fwnode_handle *fwnode,
-- 
2.45.2

