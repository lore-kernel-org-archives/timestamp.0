Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00ADB216E1E
	for <timestamp@lists.linux.dev>; Mon, 17 Feb 2025 10:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739788770; cv=none; b=tFEZUg7waYpewVo5nNovkcIzsw6eYMPkekjpT5Dj3b36/EpTP8B2//aT64lFH5nZU3VU5JTPXM/l77FU3broj8vq3A+fzas3YQSsu+ghsWXeRz5i47kOBOJg/yaakgb7lv4VXR6gFGJO9xydn5tpcStCusn+sxHJcUC9agUPzYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739788770; c=relaxed/simple;
	bh=vUF/NdChsuF8RX0PL62paJYNXihVr9EN9nW0GqUH6HU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iSvtsghjRvbNZyDsAGrQ9beQUKBk89R2FQLblZ2jBn5Q9gS/x0HOgApUEB7/RjjSBvzyVfbPU2N+jqGb/y6iJMfDFtGXo9YdcYm9qIuRikbnR7didlHntLKf/pM7kmrZlOG7nrdemBwyklgqJhgfU5l0SVrELaaCpcFwQzz/Zm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=fL6uf0Hj; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="fL6uf0Hj"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4398738217aso5236105e9.3
        for <timestamp@lists.linux.dev>; Mon, 17 Feb 2025 02:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739788765; x=1740393565; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bq7tnHLSofTfA2piDpZZwNRhnA5jRBNdKKxEFfHW/ec=;
        b=fL6uf0HjLo6ekTSotwxmV9IZUSfIZGVBY/WlibwVZ4nmy9qQA8y2HalIMbNu5h11Zx
         8Y5XCi9UHRuijpaQ2ilOHu+DGJ3SROcZdIBPcwX/0OJkA80bSVV455uxLo7wTOqL7uKj
         h4CAd7Odx4FqlJgcx+VamM3W0bSIusGUvK6mL04u8TpmlRO8wOpRHBzIUMakRnN9gr35
         h11jbfbbSRPk0Js8fXiQTSPkMso+SMHbuZ74rxDB0HP3GWcagrL0p19YW7xpOVdCbDFR
         LN9mkk7/dj7TpaoUflQgSkGebh6T9sJ8FLIw3Qce3w046giRrCUnFx5JW2Z3ElbQVRiz
         aaJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739788765; x=1740393565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bq7tnHLSofTfA2piDpZZwNRhnA5jRBNdKKxEFfHW/ec=;
        b=OugS2TbPXG0EVbU3wltLafE9zmvqcBc25vmC+yQGxu9f0VrQI3UYGiVegzC01k7Ahz
         KdTP8YLZ7H9SuSjQV91FZ3wjjJWVXdDgZw3AzJ+IlbITv+wMj5DvrqU4pihx1IehxE4G
         jDO2T6Po2VZJ/F0GNyPvvtj26v2FDYBZxGqDK+Ivh74G6EmAn1hW8fZJ9VV1lMK5nI9p
         IDKki+jqothIi47OXrMKfA3NQHgg9l9j0vqdHIkP1yuJcx5KO+M62V4E381FansCa/yh
         G1GyiOvu3VhE3ppAHWycln5IvJHE1HgcflqQ/mLcAiOpXJ00LdmhMlH4HQMuEmfCfekD
         i6dQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+Bx5TPu8uZFy8t87wdg/Bh4yKa1cvs67dwwpY214Qj+X9xHesS08y0g3bUPoMEGJfFLhOit+/F6Y=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywqo3Kg5lPEFYcee9CimRDXKo2VoiOSYIOiKSthTKor8oyJSkoe
	PA4KW3AjvIPT2Cb9NigJeynJl1zhSEDPOkViE7Gd+nKWC6GaqjTUUrn1KEvByYg=
X-Gm-Gg: ASbGncvTy3VIvrM36RUcTCqbwvKiipT054D4IoOi/AZZASL7uz8ZzJ+6z65au3+r1EY
	RTLNOiRpOhi8hTrCPJS3v+XXnjucBTwFpcGOMQf/DwcYq2IKUcst0eMe9EaJtozPHMI9mv0pd6m
	WvbtHhEg3rHL3c/n8vRgYT1MZsI//dVzIdzw2gJu1Qnq9+I0JLM1oSYj06ecqVrA5iyUAW4VUG1
	5V86yknjNFJHeGbOpkU/40ntpuy/jYAI75P9mq8ROfLPJxMuO5XsLU2LSKrT3Xu4V3neDtNX1Wt
	IIA6F/gUSDmD
X-Google-Smtp-Source: AGHT+IE4CNwnlKoha9ADPAeKHqx7QY4/pSOdlR/jtGXh8ZGwx2i49taknc0Hm9Pgs+7Gplgq0zx0mw==
X-Received: by 2002:a05:600c:3ca3:b0:439:60bc:71e5 with SMTP id 5b1f17b1804b1-4396e72aac4mr73128495e9.26.1739788765080;
        Mon, 17 Feb 2025 02:39:25 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:8707:ccd:3679:187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a06d1f2sm147990095e9.18.2025.02.17.02.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 02:39:24 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Dipen Patel <dipenp@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	timestamp@lists.linux.dev,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v4 2/2] gpiolib: don't build HTE code with CONFIG_HTE disabled
Date: Mon, 17 Feb 2025 11:39:22 +0100
Message-ID: <20250217103922.151047-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250217103922.151047-1-brgl@bgdev.pl>
References: <20250217103922.151047-1-brgl@bgdev.pl>
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

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v4:
- rebased after fixing conflicts

 drivers/gpio/gpiolib.c        |  2 ++
 include/linux/gpio/consumer.h | 36 +++++++++++++++++++++--------------
 2 files changed, 24 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index f261f7893f85..65ca749a1078 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2906,6 +2906,7 @@ int gpiod_direction_output_nonotify(struct gpio_desc *desc, int value)
 	return 0;
 }
 
+#if IS_ENABLED(CONFIG_HTE)
 /**
  * gpiod_enable_hw_timestamp_ns - Enable hardware timestamp in nanoseconds.
  *
@@ -2971,6 +2972,7 @@ int gpiod_disable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags)
 	return ret;
 }
 EXPORT_SYMBOL_GPL(gpiod_disable_hw_timestamp_ns);
+#endif /* CONFIG_HTE */
 
 /**
  * gpiod_set_config - sets @config for a GPIO
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index 0dc49b5fca5c..0b2b56199c36 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -114,8 +114,6 @@ int gpiod_get_direction(struct gpio_desc *desc);
 int gpiod_direction_input(struct gpio_desc *desc);
 int gpiod_direction_output(struct gpio_desc *desc, int value);
 int gpiod_direction_output_raw(struct gpio_desc *desc, int value);
-int gpiod_enable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags);
-int gpiod_disable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags);
 
 /* Value get/set from non-sleeping context */
 int gpiod_get_value(const struct gpio_desc *desc);
@@ -347,18 +345,6 @@ static inline int gpiod_direction_output_raw(struct gpio_desc *desc, int value)
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
@@ -559,6 +545,28 @@ struct gpio_desc *devm_fwnode_gpiod_get_index(struct device *dev,
 
 #endif /* CONFIG_GPIOLIB */
 
+#if IS_ENABLED(CONFIG_GPIOLIB) && IS_ENABLED(CONFIG_HTE)
+int gpiod_enable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags);
+int gpiod_disable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags);
+#else
+static inline int gpiod_enable_hw_timestamp_ns(struct gpio_desc *desc,
+					       unsigned long flags)
+{
+	if (!IS_ENABLED(CONFIG_GPIOLIB))
+		WARN_ON(desc);
+
+	return -ENOSYS;
+}
+static inline int gpiod_disable_hw_timestamp_ns(struct gpio_desc *desc,
+						unsigned long flags)
+{
+	if (!IS_ENABLED(CONFIG_GPIOLIB))
+		WARN_ON(desc);
+
+	return -ENOSYS;
+}
+#endif /* CONFIG_GPIOLIB && CONFIG_HTE */
+
 static inline
 struct gpio_desc *devm_fwnode_gpiod_get(struct device *dev,
 					struct fwnode_handle *fwnode,
-- 
2.45.2

