Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F801DDAF
	for <timestamp@lists.linux.dev>; Tue,  5 Sep 2023 18:53:53 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-3ff1c397405so28802915e9.3
        for <timestamp@lists.linux.dev>; Tue, 05 Sep 2023 11:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1693940032; x=1694544832; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UrAFFOP3UXm+2vTLeazN1us+BKa1tnA/xN1dYjhLvHM=;
        b=qaL0N5ssAKdWrtaTacx0hOWg+2atu4o6fLRD89KoodtUwAx3SWtiNo3eHtcIUy5UJS
         Lv+/vfkN4fSDypY2rKBFtM1J/XAX0ZUG8uG2cZJhnSeoWVrGEmxQFdZgzyIEGxrnC6/b
         bQhZgVO5Ffupdvu9Vgv7tp1VBlAfxmADe3q7456rIG1/T+62ekqWcbsAIfKKWLW8Rk/n
         9GhqV8lAMTJjsUTOei8sa/mVYd9hpUvWfzIi+TzPZ8Xj5i9l7M+AP9bqsVTrpK+Q6mqO
         2bWMxhFArgq493m+gJOTwZs77PZe1KeKU3BHrviKrE/JmprtyplXcyO7EAmhwbtGA0uI
         0DQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693940032; x=1694544832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UrAFFOP3UXm+2vTLeazN1us+BKa1tnA/xN1dYjhLvHM=;
        b=cVs4woqLGcoxx1xwZSMBVJISUJWySSLJMBMaYnXuj5qQ6JjJan6tWJ7G9roJDfsE8r
         HRaasPYY2LsSfoev69nOfOtqouYDKEb7Qo4oHKJEUTg6kpB1akH+1gpH554ALJiTjMfK
         QVVs0JAfrWo+luYfiyDEitBYMniXhWD23r6pOG2umIM95mxPuLfULFkYnMhhYittbFeE
         0KuY5XA9FxR6rv5ke7md4Jc8NZEJGGIujiQBui0HN4lIST3EYX23pd6RHKaYJZopeN8z
         ma13K3TwEAU8Nb/8w/9TSg/0c/W6yuBrKZTJ5mnJ0EwWjU/LPaDTtiMOZlNvbmyOPDMT
         tmOQ==
X-Gm-Message-State: AOJu0YzAoYoUViS+J/7S7bwa6gSyhPqHQJ19qyqDKOvkZNaXjjMnG+va
	kI8+tBGw/BEUll6pTqceDj9QVA==
X-Google-Smtp-Source: AGHT+IG5rvnvzkhR7zSqbm37o4SyQS5DF2Q3QExpMFHirbdRnNeCry1xvOOt3d5Fk7gOho9h35WBqA==
X-Received: by 2002:a05:600c:11ce:b0:3fe:2011:a7ce with SMTP id b14-20020a05600c11ce00b003fe2011a7cemr453840wmi.6.1693940031710;
        Tue, 05 Sep 2023 11:53:51 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7a54:5dbc:6d09:48b7])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c249100b003fbc30825fbsm17550010wms.39.2023.09.05.11.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 11:53:51 -0700 (PDT)
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
Subject: [PATCH 21/21] gpiolib: remove gpiochip_find()
Date: Tue,  5 Sep 2023 20:53:09 +0200
Message-Id: <20230905185309.131295-22-brgl@bgdev.pl>
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

With all users of gpiochip_find() converted to using gpio_device_find(),
we can now remove this function from the kernel.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c      | 22 ----------------------
 include/linux/gpio/driver.h |  3 ---
 2 files changed, 25 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 90e8c3d8b6f6..bd700fb4871e 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1081,28 +1081,6 @@ void gpiochip_remove(struct gpio_chip *gc)
 }
 EXPORT_SYMBOL_GPL(gpiochip_remove);
 
-/*
- * FIXME: This will be removed soon.
- *
- * This function is depracated, don't use.
- */
-struct gpio_chip *gpiochip_find(void *data,
-				int (*match)(struct gpio_chip *gc,
-					     void *data))
-{
-	struct gpio_device *gdev;
-	struct gpio_chip *gc = NULL;
-
-	gdev = gpio_device_find(data, match);
-	if (gdev) {
-		gc = gdev->chip;
-		gpio_device_put(gdev);
-	}
-
-	return gc;
-}
-EXPORT_SYMBOL_GPL(gpiochip_find);
-
 /**
  * gpio_device_find() - find a specific GPIO device
  * @data: data to pass to match function
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index bb9ec741bfda..7d2bf464478a 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -603,9 +603,6 @@ int devm_gpiochip_add_data_with_key(struct device *dev, struct gpio_chip *gc,
 				    void *data, struct lock_class_key *lock_key,
 				    struct lock_class_key *request_key);
 
-struct gpio_chip *gpiochip_find(void *data,
-				int (*match)(struct gpio_chip *gc, void *data));
-
 struct gpio_device *gpio_device_find(void *data,
 				     int (*match)(struct gpio_chip *gc,
 						  void *data));
-- 
2.39.2

