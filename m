Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D051215F5B
	for <timestamp@lists.linux.dev>; Mon, 17 Feb 2025 10:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739788768; cv=none; b=R2f4kD+ctOKfij204+WJGak65Z2ZA6p4/l/W2J7xuRFZcbKm4W2obOVeGMZKi2Dq8oNJ4tVYh3dCSQ6vvDD8neIJGk14bGjQowK6ZdQwTPpGnWd+flCkbEiaFxxJVannI/hAM4DNJ3O5/tOM5qqGRpaiWTvqFv9q8r8P4c1mN1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739788768; c=relaxed/simple;
	bh=xr3bci71BPUXSkfBFENqd5IrCtweRTea5NGCRVUdUgI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kVaU7k+8zdsBzYW5QgNKP/CTFnQF2zA7oCh24n06YEvnjxMSb0KZx9kflLnUl2Q4LVwxXsZbhu4Zqi7/nQwRTzE9/J/O44lS3McS0IbggEaFBCWaQmVDkpZGXl0fBY9OZtfxt0G7qvybM/8DFc9VPVpw7KMoWSATaS/b4LRuKeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=psT5YdpV; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="psT5YdpV"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43962f7b0e4so24738685e9.3
        for <timestamp@lists.linux.dev>; Mon, 17 Feb 2025 02:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739788764; x=1740393564; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1HYro2OVhQtcA+5FjQleajegsLd+JYaJCTYUd5fxBcM=;
        b=psT5YdpV0HYWVxMhN1TwBP//qClcKjUjnbImsm3PzXpuQt5Fmb3SR+kh/+2YLzIQBY
         soXbuS0zoaO69WM4cM1NgARLdXrurvpMSpQaw+dtXNtANYGGcoAcADn2EJMQFMx+IEVX
         1bQw2NGM90t2635OhKHLawqYPQjfllbZgbKH7bP9qeeZMP3Onu7fs+sJlOfCLILwgFbs
         iLNlPQzIhKYp/Pb8NqCuOTqOtklVGIBcHmTeNC2Y0qIt2Itq/xJ3sIaCziHX2S4zEFSC
         PKVaMf0D5K+g3nlVslOSuTji+1rrZQsjXSqIBBSm0JDKXVH9eTIEur8kMsXBW5ykR/an
         EHzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739788764; x=1740393564;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1HYro2OVhQtcA+5FjQleajegsLd+JYaJCTYUd5fxBcM=;
        b=uhdFOU0G/iq5wXxBDs2ljULKPamlaD6eH8KDO9wQuD5IdWZu0irTzLVgrCIt0/hAkM
         /v+ZDNDqaN0BW28aB7c6b8f9lIc8LuNALoVc1jDmYAQAnkX3I87tP/gNg+Fydyc+pO0S
         F3V40ZvOfYkzg0i6nYQ9T1SpITIOuNySIGBVFqn/SgC0wPLh0ENIguH53AxSv3maWdqa
         Tz1SZATXwgzOVg03xk91UTpT+zcqFz5QGno/ACotTU1V6mFa/gI2GwKYq0yX4hFjgQgi
         ywE8eMKv1mysjDe+Vq8Ds/aR1iUpJ2Psj2y1OjR0OV/oxzwJamAyqFsmhooVT8khEcg2
         /qgg==
X-Forwarded-Encrypted: i=1; AJvYcCVAcn5hM40MOLqPgLj8JIib1sHHi+pd6mYAPhmd1wQcquUn+eKYtizSpayjjRAC53c7qbUx5LIwbso=@lists.linux.dev
X-Gm-Message-State: AOJu0YxS9M0quJJXe8y7fB9ETc+8Yb3kEvnp057ssw2GfiHZyuaYq7Fv
	+9omQzREpIg4oH/gltLzQwnrLXdqEDIZh85m6CfxLcZHZk1qUTtusdVOzx1LHCc=
X-Gm-Gg: ASbGnctWGSv9tYdZq6eKhv8X3LYtoYRtKlSpnq2kbmjGtbStvk4NPg0JvZqsYKz55cB
	SR5ZVriT0Hk+Sco7lVaURsZxx6EU4HlK3Y7/0/1hu0DZrCsGp7TZxU7qfTvU8QJeZcNUay0f181
	Ms/sk8yAcUSl4XO2dHDDVESgts0Q3tZ2NwtN7zAjJkDQSJ1iu66EgTmOHNkV2S+NDEmB8GO0ImA
	i/pWMh4u8D8PbbyVFvPYVgNEHhVNpvN+0yKYlDlZMQlEeCMeNq55CsJbwkWS0iyKRQFnhj6TcsW
	HI2slBYVltrB
X-Google-Smtp-Source: AGHT+IFhBaP2rw+cChlFIU4ELkEL9E5omA2StR9DW0zO8+P0LiXu1aUpYNygZP6CdmyuOYdfeg6S7g==
X-Received: by 2002:a05:600c:3b05:b0:436:1be4:c9b4 with SMTP id 5b1f17b1804b1-4396e750814mr73869305e9.27.1739788764342;
        Mon, 17 Feb 2025 02:39:24 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:8707:ccd:3679:187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a06d1f2sm147990095e9.18.2025.02.17.02.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 02:39:24 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Dipen Patel <dipenp@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	timestamp@lists.linux.dev,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v4 1/2] gpiolib: move all includes to the top of gpio/consumer.h
Date: Mon, 17 Feb 2025 11:39:21 +0100
Message-ID: <20250217103922.151047-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We have several conditional includes depending on !CONFIG_GPIOLIB. This
is supposed to reduce compilation time with CONFIG_GPIOLIB=y but in
practice there's no difference on modern machines. It makes adding new
stubs that depend on more than just GPIOLIB harder so move them all to
the top, unduplicate them and replace asm/ with preferred linux/
alternatives.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v4:
- rebased after fixing conflicts

 include/linux/gpio/consumer.h | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index 5cbd4afd7862..0dc49b5fca5c 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -3,7 +3,10 @@
 #define __LINUX_GPIO_CONSUMER_H
 
 #include <linux/bits.h>
+#include <linux/bug.h>
 #include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/kernel.h>
 #include <linux/types.h>
 
 struct acpi_device;
@@ -184,11 +187,6 @@ struct gpio_desc *devm_fwnode_gpiod_get_index(struct device *dev,
 
 #else /* CONFIG_GPIOLIB */
 
-#include <linux/err.h>
-#include <linux/kernel.h>
-
-#include <asm/bug.h>
-
 static inline int gpiod_count(struct device *dev, const char *con_id)
 {
 	return 0;
@@ -609,8 +607,6 @@ int devm_acpi_dev_add_driver_gpios(struct device *dev,
 
 #else  /* CONFIG_GPIOLIB && CONFIG_ACPI */
 
-#include <linux/err.h>
-
 static inline int acpi_dev_add_driver_gpios(struct acpi_device *adev,
 			      const struct acpi_gpio_mapping *gpios)
 {
@@ -636,8 +632,6 @@ void gpiod_unexport(struct gpio_desc *desc);
 
 #else  /* CONFIG_GPIOLIB && CONFIG_GPIO_SYSFS */
 
-#include <asm/errno.h>
-
 static inline int gpiod_export(struct gpio_desc *desc,
 			       bool direction_may_change)
 {
-- 
2.45.2

