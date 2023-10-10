Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F227321364
	for <timestamp@lists.linux.dev>; Tue, 10 Oct 2023 15:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Le9JsAMX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696951035; x=1728487035;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cfi2ScUuQ38Rjpas5/iU2szLV7W2WROp/dyzeK87y4E=;
  b=Le9JsAMXzu6hiualXFlj7fozE7j2WzEbyBFEwaRjRlaIvwiGRk1a3zCL
   BkObenoQABiMwqsbOTrjpSYgLdUBj6IIgIeRnWcgX3fEoU+ynReGQTo2e
   6599131reoVMzgww2yC0S/BDlXxz8Y/O4ENuTKW6CGV6HqYgi4XYxdvqS
   OJMlSy3ovHiCxxq8wBRs+DBWfRwrSr9LhCm0PasoHv2p8nk4oz51FN3Ca
   Uc+g9vJgmBtRWM4ipQ+SAM7jKYmdDhI/7r+vYCq2ie1vRVAhp918FVQ7M
   NYp5nZqbwkha9MPnWqMAFWxMaGvzo0gNcW4y8t1OgdW4XtPDms/aDzY2v
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="363771589"
X-IronPort-AV: E=Sophos;i="6.03,213,1694761200"; 
   d="scan'208";a="363771589"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 08:17:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="823812776"
X-IronPort-AV: E=Sophos;i="6.03,213,1694761200"; 
   d="scan'208";a="823812776"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 10 Oct 2023 08:17:11 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 484EE6DA; Tue, 10 Oct 2023 18:17:10 +0300 (EEST)
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
Subject: [PATCH v1 3/4] hte: tegra194: Remove redundant dev_err()
Date: Tue, 10 Oct 2023 18:17:08 +0300
Message-Id: <20231010151709.4104747-4-andriy.shevchenko@linux.intel.com>
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

There is no need to call the dev_err() function directly to print a custom
message when handling an error from platform_get_irq() function as it is
going to display an appropriate error message in case of a failure.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/hte/hte-tegra194.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/hte/hte-tegra194.c b/drivers/hte/hte-tegra194.c
index 339ff5921ec8..30ef1750a9fa 100644
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

