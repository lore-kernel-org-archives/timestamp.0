Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05D5DDAF
	for <timestamp@lists.linux.dev>; Tue,  5 Sep 2023 18:53:50 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-401187f8071so1120325e9.0
        for <timestamp@lists.linux.dev>; Tue, 05 Sep 2023 11:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1693940029; x=1694544829; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ZhpZtSP2svZAFrzaQvlM9FAg/vPyJ7DXBzIjcVtHYA=;
        b=1qADM5iZSajUhZqJpqruWUgqHTRnDcE6pRdChOb6KMdG5nFiWflItwuL5EI2luNnvs
         zwFV9chI9FWJ5J/R2uR3b5peX1IDM5QGeMKk3ztqdq/I23MN6zvUXvU9WqeF68yZVqX0
         sqtfuEq1ExkaKO8IaZjlfiL+zUAfTyfW1BwAPP2wZLhtyVS80/9UJqewF/5MRUCUQiYa
         l32Kv9E/XXSJqBzraZTTPEdICL+1GTuFaqtofjP86XbAh+KaZx/c3xiwicVFotaALHAi
         5QtjOWoIFjyhFnNTR5ueZyYpCyhg9I7K9KJ9GYHZupHBj1RaBrgBH2ja2QTOlTGDgytJ
         +0AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693940029; x=1694544829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ZhpZtSP2svZAFrzaQvlM9FAg/vPyJ7DXBzIjcVtHYA=;
        b=CVGf7FsRu6rYt/UGIvJwWipn1LvMAz3G/fF4ePw2SR+7B/TghT1dXwdhroJzSszZhm
         Kg0So1o86ohg/mhCN1lbtF47391OC684ffQ+7CezrXra0FJaifFrTEZk1tHsT3vFo+2+
         p5mc6ToX5SyubAmvLUwGQ551bk4IaVjhnWKngbdIpPisg4Wa2VSABYMpPDqErR+MAFxP
         z6O2u3aNnlgwSgscfXDdTCBCoLs5YS1/KenlCjV1EtF5Qyv3B9As1IlqCLtsONgyRv6T
         MmhErMT74pS3w9nbV5JmzVsw6fnga+xpF6pdJui5pVu1wQqMkhPeatn8T8ZMKrdGIeFi
         MZnw==
X-Gm-Message-State: AOJu0YzCXLugK2IktaWFgTePwe5h0cbEKtpT5WfvsAsjRF9wV+2Fn1aD
	Q3I3Km1HdRUlrC+8pipPdP+fag==
X-Google-Smtp-Source: AGHT+IH6GCfGhH5bbknVyv1QFmzhhSWppXhliMEz+gshhPkUMADba7JqAHg0E1eXfiJxmPf9zlRrog==
X-Received: by 2002:a05:600c:3d0d:b0:402:b8:d022 with SMTP id bh13-20020a05600c3d0d00b0040200b8d022mr609236wmb.16.1693940029130;
        Tue, 05 Sep 2023 11:53:49 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7a54:5dbc:6d09:48b7])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c249100b003fbc30825fbsm17550010wms.39.2023.09.05.11.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 11:53:48 -0700 (PDT)
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
Subject: [PATCH 19/21] gpio: swnode: replace gpiochip_find() with gpio_device_find_by_label()
Date: Tue,  5 Sep 2023 20:53:07 +0200
Message-Id: <20230905185309.131295-20-brgl@bgdev.pl>
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
Update the swnode GPIO code.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib-swnode.c | 29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/drivers/gpio/gpiolib-swnode.c b/drivers/gpio/gpiolib-swnode.c
index b5a6eaf3729b..56c8519be538 100644
--- a/drivers/gpio/gpiolib-swnode.c
+++ b/drivers/gpio/gpiolib-swnode.c
@@ -31,31 +31,26 @@ static void swnode_format_propname(const char *con_id, char *propname,
 		strscpy(propname, "gpios", max_size);
 }
 
-static int swnode_gpiochip_match_name(struct gpio_chip *chip, void *data)
+static struct gpio_device *swnode_get_gpio_device(struct fwnode_handle *fwnode)
 {
-	return !strcmp(chip->label, data);
-}
+	const struct software_node *gdev_node;
+	struct gpio_device *gdev;
 
-static struct gpio_chip *swnode_get_chip(struct fwnode_handle *fwnode)
-{
-	const struct software_node *chip_node;
-	struct gpio_chip *chip;
-
-	chip_node = to_software_node(fwnode);
-	if (!chip_node || !chip_node->name)
+	gdev_node = to_software_node(fwnode);
+	if (!gdev_node || !gdev_node->name)
 		return ERR_PTR(-EINVAL);
 
-	chip = gpiochip_find((void *)chip_node->name, swnode_gpiochip_match_name);
-	return chip ?: ERR_PTR(-EPROBE_DEFER);
+	gdev = gpio_device_find_by_label((void *)gdev_node->name);
+	return gdev ?: ERR_PTR(-EPROBE_DEFER);
 }
 
 struct gpio_desc *swnode_find_gpio(struct fwnode_handle *fwnode,
 				   const char *con_id, unsigned int idx,
 				   unsigned long *flags)
 {
+	struct gpio_device *gdev __free(gpio_device_put) = NULL;
 	const struct software_node *swnode;
 	struct fwnode_reference_args args;
-	struct gpio_chip *chip;
 	struct gpio_desc *desc;
 	char propname[32]; /* 32 is max size of property name */
 	int error;
@@ -77,12 +72,12 @@ struct gpio_desc *swnode_find_gpio(struct fwnode_handle *fwnode,
 		return ERR_PTR(error);
 	}
 
-	chip = swnode_get_chip(args.fwnode);
+	gdev = swnode_get_gpio_device(args.fwnode);
 	fwnode_handle_put(args.fwnode);
-	if (IS_ERR(chip))
-		return ERR_CAST(chip);
+	if (IS_ERR(gdev))
+		return ERR_CAST(gdev);
 
-	desc = gpiochip_get_desc(chip, args.args[0]);
+	desc = gpiochip_get_desc(gdev->chip, args.args[0]);
 	*flags = args.args[1]; /* We expect native GPIO flags */
 
 	pr_debug("%s: parsed '%s' property of node '%pfwP[%d]' - status (%d)\n",
-- 
2.39.2

