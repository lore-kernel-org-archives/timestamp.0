Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDC13AC0F
	for <timestamp@lists.linux.dev>; Wed, 11 Oct 2023 20:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PbGQqUkC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697056007; x=1728592007;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZRhu6GBogXEtacyQpk9MfPzZjieYt+h/X2GsbW/ugqU=;
  b=PbGQqUkCHfWl/z39Hmo2Pe/omc4YEB2mtpxEjtTP8w66A2mqWcIEG1H4
   VPujcZH1QHdTrRcImoQXkhKo0NwITKDjhAmv+X0TIYDVj79i5dcEAHsTF
   KQYXvGP+IZ61Y+u82ZMtVJeHEG6w4eoEZuEAPNNDpcndvo/Pp5aAY8a0G
   D6AIeBQJnUOBnQrRPA1IUQn3dzCdXsUWWtbZGPhKtAR3rGQkFwNJhniVm
   LzRf9sRj2FrLL2CuH1XR0+aqXYf0e5H3f0lw287mearjip1T2+gMtdW0d
   sY3RIpJekKDOC2/Cx1OQNabSKbyEiq0zptK4Q1hE7+cIhRqru8s0ZyB0U
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="471015115"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="471015115"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 13:26:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="783393503"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="783393503"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 11 Oct 2023 13:26:43 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 2C8766DA; Wed, 11 Oct 2023 23:26:42 +0300 (EEST)
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
Subject: [PATCH v2 3/4] hte: tegra194: Remove redundant dev_err()
Date: Wed, 11 Oct 2023 23:26:37 +0300
Message-Id: <20231011202638.372382-4-andriy.shevchenko@linux.intel.com>
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

There is no need to call the dev_err() function directly to print a custom
message when handling an error from platform_get_irq() function as it is
going to display an appropriate error message in case of a failure.

Reviewed-by: Dipen Patel <dipenp@nvidia.com>
Tested-by: Dipen Patel <dipenp@nvidia.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Link: https://lore.kernel.org/r/20231010151709.4104747-4-andriy.shevchenko@linux.intel.com
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/hte/hte-tegra194.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/hte/hte-tegra194.c b/drivers/hte/hte-tegra194.c
index f6c2dbcd0aca..cf6058193403 100644
--- a/drivers/hte/hte-tegra194.c
+++ b/drivers/hte/hte-tegra194.c
@@ -731,10 +731,8 @@ static int tegra_hte_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	ret = platform_get_irq(pdev, 0);
-	if (ret < 0) {
-		dev_err_probe(dev, ret, "failed to get irq\n");
+	if (ret < 0)
 		return ret;
-	}
 	hte_dev->hte_irq = ret;
 	ret = devm_request_irq(dev, hte_dev->hte_irq, tegra_hte_isr, 0,
 			       dev_name(dev), hte_dev);
-- 
2.40.0.1.gaa8946217a0b

