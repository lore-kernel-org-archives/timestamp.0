Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539DC3A26E
	for <timestamp@lists.linux.dev>; Wed, 11 Oct 2023 20:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OtH1gSSK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697056011; x=1728592011;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=dE6YTAgpIUGjQqgWImfLh5Fh6tJ6lKZxZUBMMvpIri0=;
  b=OtH1gSSKgihCHLsSI29svpo/j+cNXYwFWWyjYVESua5yNeYhIRZ+8gwB
   lEHrj7TR+cZT3cB8G14+xc36oKE/tT7xtNFu7EC98qXlES38cj1cGoDaJ
   hKg0hXd/9cG3h7s+ks5n4v1HtjmVVzzG7WkeuZeUZYqBG2RHAOCbtc0Rc
   qc8rLTju79DCxwwun9/XSGMmM77goaJBN6Ux1unVAIoi5KkbD1b6iUv8s
   r36IdgueCQXY7wA57MG8HQa3WIem8nO/4FWAtiW2/5ofIdBFjpMwIZU3X
   bOu5F/yrkan2r6+U3ZOvLVwa0ye/9q7OPatld6ou53teN6yPtkLbEruFy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="471015133"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="471015133"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 13:26:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="783393505"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="783393505"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 11 Oct 2023 13:26:43 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id ED1B7430; Wed, 11 Oct 2023 23:26:41 +0300 (EEST)
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
Subject: [PATCH v2 0/4] hte: Improve GPIO handling and other cleanups
Date: Wed, 11 Oct 2023 23:26:34 +0300
Message-Id: <20231011202638.372382-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a series that provides a new API to GPIO library (so far only
available in the GPIO tree), and respective update to the Tegra
HTE driver. On top a couple of other cleaups (patches 3 & 4, they
can be applied separately).

Patch 2 inherited tags from its respective discussion thread [1].

Due to dependencies this either should be applied to the GPIO tree,
or to the HTE when GPIO updates land the upstream (optionally with
the first patch be applied even now to the GPIO tree independently).

Another option is to have an immutable branch or tag, but I assume
that was discussed and rejected (?) in [1].

In v2:
- collected tags (Linus, Dipen) 
- fixed couple of typos (Dipen)

Link: https://lore.kernel.org/linux-gpio/20230905185309.131295-15-brgl@bgdev.pl/ [1]
Cc: Dipen Patel <dipenp@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>

Andy Shevchenko (3):
  gpiolib: provide gpio_device_find_by_fwnode()
  hte: tegra194: Remove redundant dev_err()
  hte: tegra194: Switch to LATE_SIMPLE_DEV_PM_OPS()

Bartosz Golaszewski (1):
  hte: tegra194: don't access struct gpio_chip

 drivers/gpio/gpiolib.c      | 20 ++++++++++++++++
 drivers/hte/hte-tegra194.c  | 46 +++++++++++++++++++------------------
 include/linux/gpio/driver.h |  1 +
 3 files changed, 45 insertions(+), 22 deletions(-)

-- 
2.40.0.1.gaa8946217a0b

