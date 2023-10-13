Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9B4DDAF
	for <timestamp@lists.linux.dev>; Fri, 13 Oct 2023 07:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="dCJfHglQ"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4066692ad35so18717725e9.1
        for <timestamp@lists.linux.dev>; Fri, 13 Oct 2023 00:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697181825; x=1697786625; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gb3gYagB6dDOUEqTcgUJ+Jm7aEOybfjvWpE6CZqOl1I=;
        b=dCJfHglQJ8t8qPbR9ziCCL3H4x8PMPt4mBeoRc1ZprZm9uzMRxGNua8qSBtbnnPYZv
         lWlsvDAZkKSB3IQ7emlaTaPIdr4GsdLeI+mfcfYARC5HltChkniN5MUkaBR1EPyQ6Oz2
         rFgXv9nJp1d/Zo9Z6CalMCYq3wflGvKIV/xETNK0NzgqVcAnSTzKd97fVvnXl5yCThX5
         scJIYAxZHrD+PPwqrkL2RmirkK1/UOlGUFjpg6a25NcILQqr+OajsLZz0VMU09wRgl8/
         Hmhw66MGh5IG3x1GVj0/9NqFHHLLSYvrurSNTwWfy92xoZaO2D5AdNbs5oKE1oFP1Muq
         ETcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697181825; x=1697786625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gb3gYagB6dDOUEqTcgUJ+Jm7aEOybfjvWpE6CZqOl1I=;
        b=JjL/6iWhTOYxCECJjwy/2k5L248sTiAhPe36PEf+7t/DP4jbSNLe+OSzE+zpo27r/g
         zpAt4c69A+MNKk3PNue7XMLSozV9tH/S7cKzW5kdu0hrEFSNh4vefjbaQ32mUQIJosLt
         y8mJyDweYVxyABLkH8bltGJwWqaDLPrxVhjVntSYJ2X6fdem8W7E8tE100m5Gc4QfsKT
         rU3GUetmqmSxx+jzOpnFtNU2wE2c3Pa+qfHVtYOrSyal3C9JVZxFfok7qJzNbakk7bgt
         gy+4hkoP34JO7I5Rr/BU4ahEpNsonTHYuGYcil8JPVWQRiGY7KGQEDgOLGJfadJKxTZ1
         GQuQ==
X-Gm-Message-State: AOJu0YyaS+wPQaPclhIWJNFCGdlRsHwz29YrussbYRC9ZhqGdRXpZshO
	LzVMs8BPzzCzZzLnzVFg2O7Wdg==
X-Google-Smtp-Source: AGHT+IF+RKXGEq5EHir8wsGLD0lAZnjB+wgB691VzoDXLWE0fRX7rOlEhMnxP5TPZpfSHV3Q0je+7A==
X-Received: by 2002:a05:600c:21ce:b0:407:68a3:6b5d with SMTP id x14-20020a05600c21ce00b0040768a36b5dmr3284206wmj.23.1697181825417;
        Fri, 13 Oct 2023 00:23:45 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:4209:13a:988d:80be])
        by smtp.gmail.com with ESMTPSA id y4-20020a1c4b04000000b004075d5664basm1775581wma.8.2023.10.13.00.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 00:23:45 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Dipen Patel <dipenp@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andy@kernel.org>
Cc: timestamp@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2] hte: tegra194: don't access struct gpio_chip
Date: Fri, 13 Oct 2023 09:23:40 +0200
Message-Id: <20231013072340.16411-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
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
Tested-by: Dipen Patel <dipenp@nvidia.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
[andy: used gpio_device_find_by_fwnode()]
Reviewed-by: Dipen Patel <dipenp@nvidia.com>
Link: https://lore.kernel.org/r/20231010151709.4104747-3-andriy.shevchenko@linux.intel.com
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
Dipen,

Can you retest this patch now rebased on top of current GPIO for-next?

v1 -> v2:
- rebase on top of current gpio/for-next

 drivers/hte/hte-tegra194.c | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/hte/hte-tegra194.c b/drivers/hte/hte-tegra194.c
index 6fe6897047ac..341a134cb7d0 100644
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
 
@@ -418,7 +418,7 @@ static int tegra_hte_line_xlate(struct hte_chip *gc,
 	 * HTE/GTE namespace.
 	 */
 	if (gs->prov_data->type == HTE_TEGRA_TYPE_GPIO && !args) {
-		line_id = desc->attr.line_id - gs->c->base;
+		line_id = desc->attr.line_id - gpio_device_get_base(gs->gdev);
 		map = gs->prov_data->map;
 		map_sz = gs->prov_data->map_sz;
 	} else if (gs->prov_data->type == HTE_TEGRA_TYPE_GPIO && args) {
@@ -645,7 +645,7 @@ static bool tegra_hte_match_from_linedata(const struct hte_chip *chip,
 	if (!hte_dev || (hte_dev->prov_data->type != HTE_TEGRA_TYPE_GPIO))
 		return false;
 
-	return hte_dev->c == gpiod_to_chip(hdesc->attr.line_data);
+	return hte_dev->gdev == gpiod_to_gpio_device(hdesc->attr.line_data);
 }
 
 static const struct of_device_id tegra_hte_of_match[] = {
@@ -673,14 +673,11 @@ static void tegra_gte_disable(void *data)
 	tegra_hte_writel(gs, HTE_TECTRL, 0);
 }
 
-static int tegra_get_gpiochip_from_name(struct gpio_chip *chip, void *data)
+static void tegra_hte_put_gpio_device(void *data)
 {
-	return !strcmp(chip->label, data);
-}
+	struct gpio_device *gdev = data;
 
-static int tegra_gpiochip_match(struct gpio_chip *chip, void *data)
-{
-	return chip->fwnode == of_node_to_fwnode(data);
+	gpio_device_put(gdev);
 }
 
 static int tegra_hte_probe(struct platform_device *pdev)
@@ -760,8 +757,8 @@ static int tegra_hte_probe(struct platform_device *pdev)
 
 		if (of_device_is_compatible(dev->of_node,
 					    "nvidia,tegra194-gte-aon")) {
-			hte_dev->c = gpiochip_find("tegra194-gpio-aon",
-						tegra_get_gpiochip_from_name);
+			hte_dev->gdev =
+				gpio_device_find_by_label("tegra194-gpio-aon");
 		} else {
 			gpio_ctrl = of_parse_phandle(dev->of_node,
 						     "nvidia,gpio-controller",
@@ -772,14 +769,19 @@ static int tegra_hte_probe(struct platform_device *pdev)
 				return -ENODEV;
 			}
 
-			hte_dev->c = gpiochip_find(gpio_ctrl,
-						   tegra_gpiochip_match);
+			hte_dev->gdev =
+				gpio_device_find_by_fwnode(of_fwnode_handle(gpio_ctrl));
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

