Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9812FD513
	for <timestamp@lists.linux.dev>; Wed,  6 Sep 2023 14:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694010223; x=1725546223;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NkDVpIGP6hSnJ3pk9APCaVMBJZKKIjfhnS1bhhI9K34=;
  b=AVXak0ClLyCirqv5zWbH8f7oltZR9lZgmLMcRVI8yAN1c6Pgl8SYzMJA
   RaV2lcTY30HBkkW5Jc99Af3YsKzkmvBCxjvVrGNU8BthYfOfqTHWMl9Rg
   kFm56ESGFaCC/erMcTymJsGWsOYaIErVWYXsb5CMmiD7aeVJFlbfdiDcx
   l6wyvPASq0e41Yvp3kNDAwOFmwj5S4fgrc1ksL9nr5tEGO+qruAwV0dhL
   xlQ5gsYSVnuruQFFcAvFCxlYExq7foxeVSDIobrz/t2ix6LUI45Gp4OAR
   Qz5qutgfbDrPqgcAS8LI6Il6TSlnheYsCrlnRculZpg7aIChgg+0ICYmq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="408082894"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="408082894"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 07:23:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="915296693"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="915296693"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 07:23:33 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qdtRK-006xiY-08;
	Wed, 06 Sep 2023 17:23:30 +0300
Date: Wed, 6 Sep 2023 17:23:29 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Dipen Patel <dipenp@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Mark Gross <markgross@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org, timestamp@lists.linux.dev,
	linux-tegra@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 10/21] gpiolib: replace find_chip_by_name() with
 gpio_device_find_by_label()
Message-ID: <ZPiLYYzzffKaTKlT@smile.fi.intel.com>
References: <20230905185309.131295-1-brgl@bgdev.pl>
 <20230905185309.131295-11-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230905185309.131295-11-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Sep 05, 2023 at 08:52:58PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Remove all remaining uses of find_chip_by_name() (and subsequently:
> gpiochip_find()) from gpiolib.c and use the new
> gpio_device_find_by_label() instead.

...

> -		desc = gpiochip_get_desc(gc, p->chip_hwnum);
> +		desc = gpiochip_get_desc(gdev->chip, p->chip_hwnum);

Why not gpio_device_get_desc()?


-- 
With Best Regards,
Andy Shevchenko


