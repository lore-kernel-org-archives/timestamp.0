Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D001B042C
	for <timestamp@lists.linux.dev>; Fri,  7 Feb 2025 08:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738917112; cv=none; b=jyPhhLoJsrbYpcxF4iwpOrv3cZHibS7sg/h4qpfQKZQ1BLTOOugVR4exYdDvn40lb/RR8oFoRTgsx51okUuZQurrsETOLpCekY8MKS15EQaAUxBgPeSx8qED/srJAzXbDDwNk6klKW8Ig5gEQzSSf0yGisxHz2uCngLqEHBEGuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738917112; c=relaxed/simple;
	bh=NFcvsTr2jMTbG67gbqmy+1fBOe2tK1hIOagDIIPVIjw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nJVA0UEhTDXpCe1x2NtDRR5z8hdnFRZm7r27/z/8YKHkl9Hx9IAK3FvAAF3RSp2VPDsjRx1yl2GIXkdTFJHyYLfqDfLAYgtGfILeG4N0hdQXF3DbBr2V16F7hQMlI0A44yrhCbzektkbs9GU7N5M0AQm0/J28cualYqdpo2JpMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=3F9bRDY/; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="3F9bRDY/"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43618283dedso17402365e9.3
        for <timestamp@lists.linux.dev>; Fri, 07 Feb 2025 00:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738917109; x=1739521909; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1hiP/lIM/V6E17F8R7p0zjqfLH9MnBXnboKjp+6HCK8=;
        b=3F9bRDY/StH3lhqzNnATrUB+7U5PaHEStrnU0HCd0CQsR3mgcNSap3iUwuljGEWIkE
         D/dvNh5GQuVnXelQo3Pd+j9HRqNvmKo7sIuGYVh4XbWuUl25igxO/c/FUkqWzLxEzB/a
         BaaTzyVSAfkew1EzyJCmZh627mcruzhMx4kw1jPk8jgtleUl8rkPwV2qvBJPI/liwbe4
         7zXyUEJZoAlQDmAIO9ublLDQJ1O/C6SQXe0f95X9HEKRkAd9mC1hAQF6kHJuAGcP12v+
         iy8qeofaMU6pttLP/Wg2S/me/kg0h3dqDlpC5UjRqRsMZSwu0HyXSHnZcCRtPPghYlnH
         7IHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738917109; x=1739521909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1hiP/lIM/V6E17F8R7p0zjqfLH9MnBXnboKjp+6HCK8=;
        b=McMEqOZ4pvMKBHIt+7Uu6epWoELzfLcUMFFaFlni7S8iXP/4ys6Ix70VR8HQ1LYRYv
         EStjCyNRAK7uuJc/Ao6emXMEMgII85SFW3HTmbwD5+djfH8gHeo5KeMSVfuLvQ9ocfkf
         nADX8lDhMxsVloSFnEzCHhip5mCrsktkxqyTVcqwv2G+E0bg49zd7qA0wSr/hmUR/bTn
         yWC5V05Hu2EBuK3pC765Rlno015jG0iUZMLZX0y078bKFiUcKqMA+2CmWRz7T5Bhix+4
         ycSHgGOc3ZnywDTmgP3vAUnod1qHJZhIE1+mKGKeFn81DrJ/NuPESu7MbZSOMFIM8SEA
         wsEA==
X-Forwarded-Encrypted: i=1; AJvYcCUiDeLGBjQFVdaQkes11SpcOBUinQyf7h6bnxFEvLtGW7ts4nCImIJ3xDXUxh/ams9br3+QhfEA1j0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzZdEO/wfLRbquh9M8vsuPnh7OvugKm8m2pWADxLM2l7cL0jnT5
	Xlo+5QNYwqYngNIYObLlIowMziwZ4y7zVwmL2N6sqp238IrYLG6gkgTMWZs8e+Psjs5/k9xqsou
	gX8E=
X-Gm-Gg: ASbGncvsqNnQcdOtZK+fF28Jg32sW/r7MWAokOf/j+6+wQ8CF12afSOcWmZtUPaCnLU
	ctqnrSUB3VhcOSVFffwpmC3xvdqVXD6RIjHujzgn94NEzCQNpBGGbsuAZuD+21J2rVIvQ2vDH36
	UyjV1cBoLKZ9iVm0SdWu1nOd1Pu0CEbHcR/J2R5oEm2FMcn0xASlSfBRzAA2RzUvdugRPaQSWFn
	2SRdl3GuZQbGp62sp0ZbiHSu6N7xmepB2tiqhUb6idCVeXjtO6tVu+tkXwAzglbWnx2ufNi0nRy
	n9TikUCqJ/yBpQ==
X-Google-Smtp-Source: AGHT+IFOlZiM3R6pqOc8wdbixGurSPRs6W4HzpwA+czNqsoQykv2dpkhOJF/Zj4Aws45Gicc3f+vOQ==
X-Received: by 2002:a5d:6d0d:0:b0:38d:b229:87ff with SMTP id ffacd0b85a97d-38dc8db1d53mr1416604f8f.14.1738917109114;
        Fri, 07 Feb 2025 00:31:49 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:ae69:c28e:8e23:dca])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dca0041sm46003075e9.14.2025.02.07.00.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 00:31:48 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Dipen Patel <dipenp@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	timestamp@lists.linux.dev,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2] gpiolib: don't build HTE code with CONFIG_HTE disabled
Date: Fri,  7 Feb 2025 09:31:46 +0100
Message-ID: <20250207083146.17872-1-brgl@bgdev.pl>
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
Changes in v2:
- reduce preprocessor ifdiffery

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
index 0b1acd014186..bc670f98faa6 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -111,8 +111,6 @@ int gpiod_get_direction(struct gpio_desc *desc);
 int gpiod_direction_input(struct gpio_desc *desc);
 int gpiod_direction_output(struct gpio_desc *desc, int value);
 int gpiod_direction_output_raw(struct gpio_desc *desc, int value);
-int gpiod_enable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags);
-int gpiod_disable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags);
 
 /* Value get/set from non-sleeping context */
 int gpiod_get_value(const struct gpio_desc *desc);
@@ -349,18 +347,6 @@ static inline int gpiod_direction_output_raw(struct gpio_desc *desc, int value)
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
@@ -561,6 +547,28 @@ struct gpio_desc *devm_fwnode_gpiod_get_index(struct device *dev,
 
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

