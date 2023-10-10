Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640564736B
	for <timestamp@lists.linux.dev>; Tue, 10 Oct 2023 15:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fruV9EC6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696951039; x=1728487039;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=b+eQ/uwdz+URzIJFW2ABqaZbfeJbxTuJSgGGfs7US3E=;
  b=fruV9EC6mCD5DvrnyTIe6bLhwf9+p0BB57jzvdjnJLiMaMOOiO7D7i4B
   OK45OsyA+1e0YcLFz1Nkt0zUr1+CPsra++Uk7ZRgOn+zg70oHjoYlU8H8
   5hxkCkrrFJ0SbuVgNytgd3h9Vx0FDgOLbuVdolgAgrBKHzouU4iC1R2mG
   nIY1jtHsFQIpVqqN8DCwSpfFMlvAp5CquqKhsau9BovLtPonSQwc8BORJ
   zSG1uYkWs4YzJrf+9LISQ4qKKV8AtdQ5RVQJpm0OWmjwlrvq0QrwyWiPD
   mJWfij8Edw2jazUhPcd7nQTqK0nlmx4XdhN9hI3QAiujCS6dsl7q+gU6B
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="363771582"
X-IronPort-AV: E=Sophos;i="6.03,213,1694761200"; 
   d="scan'208";a="363771582"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 08:17:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="823812775"
X-IronPort-AV: E=Sophos;i="6.03,213,1694761200"; 
   d="scan'208";a="823812775"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 10 Oct 2023 08:17:11 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 524C671B; Tue, 10 Oct 2023 18:17:10 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Dipen Patel <dipenp@nvidia.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	timestamp@lists.linux.dev,
	linux-tegra@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH v1 4/4] hte: tegra194: Switch to LATE_SIMPLE_DEV_PM_OPS()
Date: Tue, 10 Oct 2023 18:17:09 +0300
Message-Id: <20231010151709.4104747-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20231010151709.4104747-1-andriy.shevchenko@linux.intel.com>
References: <20231010151709.4104747-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SET_LATE_SYSTEM_SLEEP_PM_OPS is deprecated, replace it with
LATE_SYSTEM_SLEEP_PM_OPS() and use pm_sleep_ptr() for setting
the driver's pm routines. We can now remove the __maybe_unused
qualifier in the suspend and resume functions.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/hte/hte-tegra194.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/hte/hte-tegra194.c b/drivers/hte/hte-tegra194.c
index 30ef1750a9fa..30fa7c0a555e 100644
--- a/drivers/hte/hte-tegra194.c
+++ b/drivers/hte/hte-tegra194.c
@@ -815,7 +815,7 @@ static int tegra_hte_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int __maybe_unused tegra_hte_resume_early(struct device *dev)
+static int tegra_hte_resume_early(struct device *dev)
 {
 	u32 i;
 	struct tegra_hte_soc *gs = dev_get_drvdata(dev);
@@ -836,7 +836,7 @@ static int __maybe_unused tegra_hte_resume_early(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused tegra_hte_suspend_late(struct device *dev)
+static int tegra_hte_suspend_late(struct device *dev)
 {
 	u32 i;
 	struct tegra_hte_soc *gs = dev_get_drvdata(dev);
@@ -856,15 +856,14 @@ static int __maybe_unused tegra_hte_suspend_late(struct device *dev)
 }
 
 static const struct dev_pm_ops tegra_hte_pm = {
-	SET_LATE_SYSTEM_SLEEP_PM_OPS(tegra_hte_suspend_late,
-				     tegra_hte_resume_early)
+	LATE_SYSTEM_SLEEP_PM_OPS(tegra_hte_suspend_late, tegra_hte_resume_early)
 };
 
 static struct platform_driver tegra_hte_driver = {
 	.probe = tegra_hte_probe,
 	.driver = {
 		.name = "tegra_hte",
-		.pm = &tegra_hte_pm,
+		.pm = pm_slee_ptr(&tegra_hte_pm),
 		.of_match_table = tegra_hte_of_match,
 	},
 };
-- 
2.40.0.1.gaa8946217a0b

