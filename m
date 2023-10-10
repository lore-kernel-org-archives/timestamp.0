Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A0E30FB4
	for <timestamp@lists.linux.dev>; Tue, 10 Oct 2023 15:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fgWcli1r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696951131; x=1728487131;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=nlNBWQ2A0/Oiqs4e9gC1rp7hpzNQKUXy0oakOEFBbE4=;
  b=fgWcli1rmeRub3tp3fkG7RAvfuG+66+zeVycgt4k7uNfdBoVPX/N1DUO
   mcehfo0UswqaF5Srhgg2Vma98B64aIGTSEkn3MrkVVf1gVl7SIqnRkqDh
   LR4dZ7Fp88Gzi/ZlDFXx2J7TN0w+v+VsozFdRp8sqOBjvo5nX0mZiXvxt
   79nmajYWuIBZHJUZh5QwxdmlnQoo5BEdCnV8SpZkHn0weuhCUsk1M+kx0
   NHsoYqp/n58YnMzVV7lfWXGtsV+M/6hbNxG2xN283El46tJPBZwo20IxZ
   EA88vs+uFJa9iv3SuHg3FzfTWZoGpHx3vBLrBahtrrUSes5OnKs1ZVK9C
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="415439402"
X-IronPort-AV: E=Sophos;i="6.03,213,1694761200"; 
   d="scan'208";a="415439402"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 08:17:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="1084830072"
X-IronPort-AV: E=Sophos;i="6.03,213,1694761200"; 
   d="scan'208";a="1084830072"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 10 Oct 2023 08:17:11 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 2801135A; Tue, 10 Oct 2023 18:17:09 +0300 (EEST)
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
Subject: [PATCH v1 0/4] hte: Improve GPIO handling and other cleanups
Date: Tue, 10 Oct 2023 18:17:05 +0300
Message-Id: <20231010151709.4104747-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a series provides a new API to GPIO library (so far only
available in the GPIO tree), and respective update to the Tegra
HTE driver. On top a couple of other cleaups (patches 3 & 4, they
can be applied separately).

Patch 2 inherited tags from its respective discussion thread [1],
but I believe the Tested-by needs to be confirmed again.

Due to dependencies this either should be applied to the GPIO tree,
or to the HTE when GPIO updates land the upstream (optionally with
the first patch be applied even now to the GPIO tree independently).

Another option is to have an immutable branch or tag, but I assume
that was discussed and rejected (?) in [1].

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

