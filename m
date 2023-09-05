Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA1ED53B
	for <timestamp@lists.linux.dev>; Tue,  5 Sep 2023 18:53:30 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3fbd33a57b6so26755855e9.2
        for <timestamp@lists.linux.dev>; Tue, 05 Sep 2023 11:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1693940009; x=1694544809; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=32AzIakwES8QNoZ2moYEZisZgGIsr9B20l41KqZ1PII=;
        b=er0nv4z0cBPQgV7OyWcCpLzanKzG1skrJm2iNtJbOCcKpo60XTPAxXnRL1BWQXhGCR
         lzFkrUafn/wEjbYNa7qdX94wwfsMQS/7Xsspz2yAHUaiFOBIGcZIJGA1Xl3+atd2vkJw
         neBJ7HEz3Irx0rolGkknGgL5nZR0eATswciy0aHEgY2eAD2oxRs7ke/qYysFs6Z0Ywky
         rWGK+3sywVM3JrlEeXnuTiTs+bipCQ224kDbrgPxrR7U70pd2TeLbcspBRf0MUuWyFLj
         KliIdwY7++lo5KAB8CGFre+ZuI6gAKooT7gFlYPfrPqaarKsJfk/XP5khNwg71R89MZ7
         jrvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693940009; x=1694544809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=32AzIakwES8QNoZ2moYEZisZgGIsr9B20l41KqZ1PII=;
        b=K4PWYz7TXxKFQPmkPcFB+/zKs8sDNesMc2lRTckNgeVbwpe5bYZCLecawCP/EgZ6TM
         O0Lop8rA/O0GoGpxAA9oYgJj7QCi1T1H8enBcr1nIlaKtGSyeNbHPN5yLkbBOCUHHzsr
         XrzG34eJP2MH+tYetU5aF9Q2oblZPYsyTj5Gxsx1gXLhp8D6b1Q6qAgX+lT+ggBpboBf
         MHjkl5X4x/61GeDvh0hh/DBRJbQGgHAHHE+e/CiKXZcX8oJGd20u1D0JYe4wE9tGDJvt
         9Meo0jkIP56bLWOUS8nYGfdM8Y/t2YL2jdvF5c+d+hsW/OQfC/lNV4v8PIt6+HkN1kVl
         KiKQ==
X-Gm-Message-State: AOJu0Yzd77OQGnbxLWkxlAiNIDO0o4y9zaW1w+0AhNBo+0LfUT3VtKyn
	iHLBpuTq9dSuH7wu8Mw103HyVA==
X-Google-Smtp-Source: AGHT+IEMA7O/G04+pJVQEX0HMhuZh3/G19j9j9xyba1JCXjHsE+92yNux09q4RWquXB9Fm3Wgf4zQw==
X-Received: by 2002:a7b:c7d9:0:b0:3fe:207c:1aea with SMTP id z25-20020a7bc7d9000000b003fe207c1aeamr433332wmk.23.1693940008588;
        Tue, 05 Sep 2023 11:53:28 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7a54:5dbc:6d09:48b7])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c249100b003fbc30825fbsm17550010wms.39.2023.09.05.11.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 11:53:28 -0700 (PDT)
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
Subject: [PATCH 02/21] gpiolib: provide gpio_device_find()
Date: Tue,  5 Sep 2023 20:52:50 +0200
Message-Id: <20230905185309.131295-3-brgl@bgdev.pl>
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

gpiochip_find() is wrong and its kernel doc is misleading as the
function doesn't return a reference to the gpio_chip but just a raw
pointer. The chip itself is not guaranteed to stay alive, in fact it can
be deleted at any point. Also: other than GPIO drivers themselves,
nobody else has any business accessing gpio_chip structs.

Provide a new gpio_device_find() function that returns a real reference
to the opaque gpio_device structure that is guaranteed to stay alive for
as long as there are active users of it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c      | 64 ++++++++++++++++++++++++++-----------
 include/linux/gpio/driver.h |  4 +++
 2 files changed, 50 insertions(+), 18 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index f84ad54d8dbd..9e083ecb8df0 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1014,16 +1014,10 @@ void gpiochip_remove(struct gpio_chip *gc)
 }
 EXPORT_SYMBOL_GPL(gpiochip_remove);
 
-/**
- * gpiochip_find() - iterator for locating a specific gpio_chip
- * @data: data to pass to match function
- * @match: Callback function to check gpio_chip
+/*
+ * FIXME: This will be removed soon.
  *
- * Similar to bus_find_device.  It returns a reference to a gpio_chip as
- * determined by a user supplied @match callback.  The callback should return
- * 0 if the device doesn't match and non-zero if it does.  If the callback is
- * non-zero, this function will return to the caller and not iterate over any
- * more gpio_chips.
+ * This function is depracated, don't use.
  */
 struct gpio_chip *gpiochip_find(void *data,
 				int (*match)(struct gpio_chip *gc,
@@ -1031,21 +1025,55 @@ struct gpio_chip *gpiochip_find(void *data,
 {
 	struct gpio_device *gdev;
 	struct gpio_chip *gc = NULL;
-	unsigned long flags;
 
-	spin_lock_irqsave(&gpio_lock, flags);
-	list_for_each_entry(gdev, &gpio_devices, list)
-		if (gdev->chip && match(gdev->chip, data)) {
-			gc = gdev->chip;
-			break;
-		}
-
-	spin_unlock_irqrestore(&gpio_lock, flags);
+	gdev = gpio_device_find(data, match);
+	if (gdev) {
+		gc = gdev->chip;
+		gpio_device_put(gdev);
+	}
 
 	return gc;
 }
 EXPORT_SYMBOL_GPL(gpiochip_find);
 
+/**
+ * gpio_device_find() - find a specific GPIO device
+ * @data: data to pass to match function
+ * @match: Callback function to check gpio_chip
+ *
+ * Returns:
+ * New reference to struct gpio_device.
+ *
+ * Similar to bus_find_device(). It returns a reference to a gpio_device as
+ * determined by a user supplied @match callback. The callback should return
+ * 0 if the device doesn't match and non-zero if it does. If the callback
+ * returns non-zero, this function will return to the caller and not iterate
+ * over any more gpio_devices.
+ *
+ * The callback takes the GPIO chip structure as argument. During the execution
+ * of the callback function the chip is protected from being freed. TODO: This
+ * actually has yet to be implemented.
+ *
+ * If the function returns non-NULL, the returned reference must be freed by
+ * the caller using gpio_device_put().
+ */
+struct gpio_device *gpio_device_find(void *data,
+				     int (*match)(struct gpio_chip *gc,
+						  void *data))
+{
+	struct gpio_device *gdev;
+
+	guard(spinlock_irqsave)(&gpio_lock);
+
+	list_for_each_entry(gdev, &gpio_devices, list) {
+		if (gdev->chip && match(gdev->chip, data))
+			return gpio_device_get(gdev);
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(gpio_device_find);
+
 static int gpiochip_match_name(struct gpio_chip *gc, void *data)
 {
 	const char *name = data;
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index a2060dc3344b..5c5029cec226 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -606,6 +606,10 @@ int devm_gpiochip_add_data_with_key(struct device *dev, struct gpio_chip *gc,
 struct gpio_chip *gpiochip_find(void *data,
 				int (*match)(struct gpio_chip *gc, void *data));
 
+struct gpio_device *gpio_device_find(void *data,
+				     int (*match)(struct gpio_chip *gc,
+						  void *data));
+
 struct gpio_device *gpio_device_get(struct gpio_device *gdev);
 void gpio_device_put(struct gpio_device *gdev);
 
-- 
2.39.2

