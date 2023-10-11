Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FCD3AC0F
	for <timestamp@lists.linux.dev>; Wed, 11 Oct 2023 20:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eboGmKf5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697056009; x=1728592009;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8PEWN3Jey64dbzw0CESM+jaomdEbjI2kq05LEDXsXnw=;
  b=eboGmKf5k6m2kfMe3/Um1AyjVFsYeIgNL0D0w88BZanRHbfhUvTIya64
   +cCSDh5h8Ea/c0h6BLl8tfzQ6ukhzNb97B/0EojoN1vJVDYhOta8IvwfP
   WBtzweCYLEPYa/3eFNm1muw9nXn2rN02JPOCPyWnCUTB8HoLStKP1yaI3
   xmtmFx0NRmLUHfiyvtuYY+sJnAADscko1K0Un7t0C+1PMUkkrnwmLAcld
   UVOxPEO86x/MIhu6KK66y6yggHHna2u82229ZR2A7tLpNvvBacFOGRiVS
   V9aMBzddzhGlv1Ynh8GbR06rsthPXlgWa7BfERkp4pLG5mLXpC78NKD8l
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="471015122"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="471015122"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 13:26:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="783393502"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="783393502"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 11 Oct 2023 13:26:43 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 1C4B96CB; Wed, 11 Oct 2023 23:26:42 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Dipen Patel <dipenp@nvidia.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	timestamp@lists.linux.dev,
	linux-tegra@vger.kernel.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH v2 2/4] hte: tegra194: don't access struct gpio_chip
Date: Wed, 11 Oct 2023 23:26:36 +0300
Message-Id: <20231011202638.372382-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20231011202638.372382-1-andriy.shevchenko@linux.intel.com>
References: <20231011202638.372382-1-andriy.shevchenko@linux.intel.com>
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
 drivers/hte/hte-tegra194.c | 33 +++++++++++++++++++--------------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/drivers/hte/hte-tegra194.c b/drivers/hte/hte-tegra194.c
index 9fd3c00ff695..f6c2dbcd0aca 100644
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
@@ -676,14 +679,11 @@ static void tegra_gte_disable(void *data)
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
@@ -763,8 +763,8 @@ static int tegra_hte_probe(struct platform_device *pdev)
 
 		if (of_device_is_compatible(dev->of_node,
 					    "nvidia,tegra194-gte-aon")) {
-			hte_dev->c = gpiochip_find("tegra194-gpio-aon",
-						tegra_get_gpiochip_from_name);
+			hte_dev->gdev =
+				gpio_device_find_by_label("tegra194-gpio-aon");
 		} else {
 			gpio_ctrl = of_parse_phandle(dev->of_node,
 						     "nvidia,gpio-controller",
@@ -775,14 +775,19 @@ static int tegra_hte_probe(struct platform_device *pdev)
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
2.40.0.1.gaa8946217a0b

