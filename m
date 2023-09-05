Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5DCBDDD1
	for <timestamp@lists.linux.dev>; Tue,  5 Sep 2023 18:53:44 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-400a087b0bfso28122825e9.2
        for <timestamp@lists.linux.dev>; Tue, 05 Sep 2023 11:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1693940023; x=1694544823; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xc0dHDvz9aPHwfkkXEcmr6XeU35JNlu/HGwkvzCIguI=;
        b=ZbjcIufh0kN4QKTL+eTCyPMu4gzCqyBgAUrL318GFxf1o63o7W6V6RETYfiGRaUOSb
         orHHnFY/UCMg9M0vVlnMl7iWvgnwU3G0THX73NOEIhQq8+JqnBT7gJ6FMJ9cJ4ZuoQKh
         Ej3W12geJXBYN+Skn2fr9Uyap1kAEOeiv/Q6fYDDUpIpOJV33Wad0aVg2hIQ3VvrBAe8
         EAP3R+j2b4p3bk9MMXIAYeJPihTMwcAxRQ3U5LoDoLaZvFOlPYjjOlWypOdQ3/8qyl/2
         IyeZoTrb5YoENeq2F5xbOAufX5g9NGwaqo08PDYGvc/fGOr2FnEEeGG+k+uq9wc7xpQJ
         ohYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693940023; x=1694544823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xc0dHDvz9aPHwfkkXEcmr6XeU35JNlu/HGwkvzCIguI=;
        b=J9GSC5IZb1PWFPzf8OAFLBXPXEUe/5iFXyTJ99bbYbzxze9O8zMLvWZrfFh/4oUPDp
         KeOY+PEf2VjdBGgoE4H1SETLZfWrxYjkd8nwf2gpfEreuHwg7voyS/9blJ+PN4DCRK3Q
         Kq4lQ3lSm82u/q0SXqyg/gU7cpS69vNNm7GvVhcacxrZMLfGmdhTt3HfhBPtrzDBM2oI
         hHOFcpKZ04f2f9wythY5eZlLncFzvLhd8joM4QA9Onxp3wNcV6bh3j05jaoNhplaJY/f
         bUe5aW05QNMbiBNYmG3kYZtvBmk6zQPeGMqmXQWxFAs4DaOYOkUWv83NIMnzTluAhqfW
         QQAQ==
X-Gm-Message-State: AOJu0Yz/M7Kds2xqyntzRQcvjBjfkwLBA8mktXry8AtRnZ7QL8CM6a1Z
	N1hgBpB7jSu7Htg2Qyj1tEGP5A==
X-Google-Smtp-Source: AGHT+IHuUeDvZm0XqMGiNP8BC9POVIvbxw89mmcaJKbgfsfvBj7DplEY4g0IVdJg6twQF2wl+B7cWQ==
X-Received: by 2002:a1c:4c0a:0:b0:400:419c:bbe2 with SMTP id z10-20020a1c4c0a000000b00400419cbbe2mr502889wmf.24.1693940023108;
        Tue, 05 Sep 2023 11:53:43 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7a54:5dbc:6d09:48b7])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c249100b003fbc30825fbsm17550010wms.39.2023.09.05.11.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 11:53:42 -0700 (PDT)
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
Subject: [RFT PATCH 14/21] hte: tegra194: don't access struct gpio_chip
Date: Tue,  5 Sep 2023 20:53:02 +0200
Message-Id: <20230905185309.131295-15-brgl@bgdev.pl>
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

Using struct gpio_chip is not safe as it will disappear if the
underlying driver is unbound for any reason. Switch to using reference
counted struct gpio_device and its dedicated accessors.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/hte/hte-tegra194.c | 36 +++++++++++++++++++++++-------------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/drivers/hte/hte-tegra194.c b/drivers/hte/hte-tegra194.c
index 9fd3c00ff695..d83ef30c9588 100644
--- a/drivers/hte/hte-tegra194.c
+++ b/drivers/hte/hte-tegra194.c
@@ -132,7 +132,7 @@ struct tegra_hte_soc {
 	const struct tegra_hte_data *prov_data;
 	struct tegra_hte_line_data *line_data;
 	struct hte_chip *chip;
-	struct gpio_chip *c;
+	struct gpio_device *gdev;
 	void __iomem *regs;
 };
 
@@ -421,7 +421,7 @@ static int tegra_hte_line_xlate(struct hte_chip *gc,
 	 * HTE/GTE namespace.
 	 */
 	if (gs->prov_data->type == HTE_TEGRA_TYPE_GPIO && !args) {
-		line_id = desc->attr.line_id - gs->c->base;
+		line_id = desc->attr.line_id - gpio_device_get_base(gs->gdev);
 		map = gs->prov_data->map;
 		map_sz = gs->prov_data->map_sz;
 	} else if (gs->prov_data->type == HTE_TEGRA_TYPE_GPIO && args) {
@@ -643,12 +643,15 @@ static irqreturn_t tegra_hte_isr(int irq, void *dev_id)
 static bool tegra_hte_match_from_linedata(const struct hte_chip *chip,
 					  const struct hte_ts_desc *hdesc)
 {
+	struct gpio_device *gdev __free(gpio_device_put) = NULL;
 	struct tegra_hte_soc *hte_dev = chip->data;
 
 	if (!hte_dev || (hte_dev->prov_data->type != HTE_TEGRA_TYPE_GPIO))
 		return false;
 
-	return hte_dev->c == gpiod_to_chip(hdesc->attr.line_data);
+	gdev = gpiod_to_device(hdesc->attr.line_data);
+
+	return hte_dev->gdev == gdev;
 }
 
 static const struct of_device_id tegra_hte_of_match[] = {
@@ -676,16 +679,18 @@ static void tegra_gte_disable(void *data)
 	tegra_hte_writel(gs, HTE_TECTRL, 0);
 }
 
-static int tegra_get_gpiochip_from_name(struct gpio_chip *chip, void *data)
-{
-	return !strcmp(chip->label, data);
-}
-
 static int tegra_gpiochip_match(struct gpio_chip *chip, void *data)
 {
 	return chip->fwnode == of_node_to_fwnode(data);
 }
 
+static void tegra_hte_put_gpio_device(void *data)
+{
+	struct gpio_device *gdev = data;
+
+	gpio_device_put(gdev);
+}
+
 static int tegra_hte_probe(struct platform_device *pdev)
 {
 	int ret;
@@ -763,8 +768,8 @@ static int tegra_hte_probe(struct platform_device *pdev)
 
 		if (of_device_is_compatible(dev->of_node,
 					    "nvidia,tegra194-gte-aon")) {
-			hte_dev->c = gpiochip_find("tegra194-gpio-aon",
-						tegra_get_gpiochip_from_name);
+			hte_dev->gdev =
+				gpio_device_find_by_label("tegra194-gpio-aon");
 		} else {
 			gpio_ctrl = of_parse_phandle(dev->of_node,
 						     "nvidia,gpio-controller",
@@ -775,14 +780,19 @@ static int tegra_hte_probe(struct platform_device *pdev)
 				return -ENODEV;
 			}
 
-			hte_dev->c = gpiochip_find(gpio_ctrl,
-						   tegra_gpiochip_match);
+			hte_dev->gdev = gpio_device_find(gpio_ctrl,
+							 tegra_gpiochip_match);
 			of_node_put(gpio_ctrl);
 		}
 
-		if (!hte_dev->c)
+		if (!hte_dev->gdev)
 			return dev_err_probe(dev, -EPROBE_DEFER,
 					     "wait for gpio controller\n");
+
+		ret = devm_add_action_or_reset(dev, tegra_hte_put_gpio_device,
+					       hte_dev->gdev);
+		if (ret)
+			return ret;
 	}
 
 	hte_dev->chip = gc;
-- 
2.39.2

