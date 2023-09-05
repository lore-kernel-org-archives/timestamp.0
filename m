Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA22DDAF
	for <timestamp@lists.linux.dev>; Tue,  5 Sep 2023 18:53:31 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-401bbfc05fcso30008375e9.3
        for <timestamp@lists.linux.dev>; Tue, 05 Sep 2023 11:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1693940010; x=1694544810; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vqkLr0JyIMxB5faQNNXnf+zRj68nvo49fQs7ZKVuUBo=;
        b=iawWVWzEYuC10RAcm53G32MUWO/X0WQfGEdylPnjVHOmAoO8y9tnnQ6Q/NJQwXlDZX
         UurF+OhrevmCj7MzwnoBFlHWI5h9KlApea5ViMwOX4LYY8MJNWDS6m6QmGeGUwE3bJLp
         kOs/KeH4OpwpZPgO2CsFehqZbq9dD56nkgSSoTUuqmz/N5msUR9xFx3Zxq6mh9RXd1N6
         mG+/HY5rFpO0Wi94oS0CUr2wfvG5x+Amo3D0ve4bp/3UIlgL11sdvrJcN39Ttk+RzpLf
         H7ZQwzaWeoIvr5VB1Fd2WImQqHvXz0BelDjLvrEkr5vMdl40vt0RVdqKf4Tx5rXHMwgw
         Rz5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693940010; x=1694544810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vqkLr0JyIMxB5faQNNXnf+zRj68nvo49fQs7ZKVuUBo=;
        b=iD7mcwHW539+7Wo9T9+xX29ZOfvH+fx59yfPq7eUP81b9wMo2G1TsGn6mXAnRR8dog
         z2RGvhO4HRaQ8tbcC6giMmrP/rhycKIgQ4Ojt9IXjbSsDSC4dBQ5C0JV3j1/mOUvjZfd
         jh4+TFom+IEkgpwaP+lsBZIjhzpjtPTKAS3H84es/TwPWlncOC7pQTXTQY2x/gm60Tgy
         EfALFhVXqrqx64WFO22s04a2qjv7+SSX3s9kSTVc9UhL0251fov9rVln/mOgN4ySjuWC
         UL3mx5tQPlc8lOy4jjDWw9Cm+KEP1OxAhtb8WmW7JSPnL4xlGWdPNkRLQv8H76D/sAF7
         w2VQ==
X-Gm-Message-State: AOJu0YxflPLXPmpoBVOya6CYPH3lEl1mpOckbJ++/8ecp/jAN6rmKzMK
	5nCwAIyFtnYl2deLHwg94iea7M89izVqNs3PEqY=
X-Google-Smtp-Source: AGHT+IG3KG15PaiG7DgNG5yZVi1RIG05HTUsTSLH76kG9iwAZEGSHThfSg45jv+oBWQBQS0UnnvYaw==
X-Received: by 2002:a05:600c:2256:b0:3fe:1af6:6542 with SMTP id a22-20020a05600c225600b003fe1af66542mr449099wmm.33.1693940009775;
        Tue, 05 Sep 2023 11:53:29 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7a54:5dbc:6d09:48b7])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c249100b003fbc30825fbsm17550010wms.39.2023.09.05.11.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 11:53:29 -0700 (PDT)
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
Subject: [PATCH 03/21] gpiolib: provide gpio_device_find_by_label()
Date: Tue,  5 Sep 2023 20:52:51 +0200
Message-Id: <20230905185309.131295-4-brgl@bgdev.pl>
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

By far the most common way of looking up GPIO devices is using their
label. Provide a helpers for that to avoid every user implementing their
own matching function.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c      | 21 +++++++++++++++++++++
 include/linux/gpio/driver.h |  1 +
 2 files changed, 22 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 9e083ecb8df0..74b837671d30 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -20,6 +20,7 @@
 #include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
+#include <linux/string.h>
 
 #include <linux/gpio.h>
 #include <linux/gpio/driver.h>
@@ -1074,6 +1075,26 @@ struct gpio_device *gpio_device_find(void *data,
 }
 EXPORT_SYMBOL_GPL(gpio_device_find);
 
+static int gpio_chip_match_by_label(struct gpio_chip *gc, void *label)
+{
+	return gc->label && !strcmp(gc->label, label);
+}
+
+/**
+ * gpio_device_find_by_label() - wrapper around gpio_device_find() finding the
+ *                               GPIO device by its backing chip's label
+ * @label: Label to lookup
+ *
+ * Returns:
+ * Reference to the GPIO device or NULL. Reference must be released with
+ * ``gpio_device_put``.
+ */
+struct gpio_device *gpio_device_find_by_label(const char *label)
+{
+	return gpio_device_find((void *)label, gpio_chip_match_by_label);
+}
+EXPORT_SYMBOL_GPL(gpio_device_find_by_label);
+
 static int gpiochip_match_name(struct gpio_chip *gc, void *data)
 {
 	const char *name = data;
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 5c5029cec226..92f7143bad3e 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -609,6 +609,7 @@ struct gpio_chip *gpiochip_find(void *data,
 struct gpio_device *gpio_device_find(void *data,
 				     int (*match)(struct gpio_chip *gc,
 						  void *data));
+struct gpio_device *gpio_device_find_by_label(const char *label);
 
 struct gpio_device *gpio_device_get(struct gpio_device *gdev);
 void gpio_device_put(struct gpio_device *gdev);
-- 
2.39.2

