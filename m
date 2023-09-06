Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8023E10782
	for <timestamp@lists.linux.dev>; Wed,  6 Sep 2023 14:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694011854; x=1725547854;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HjAh8SMqCXR1Rjl9aKlTDFEP6jadc3qGb5loq/FNe5w=;
  b=S9rqx7YFrLjE8Yz51rlRoRfwYohm2HrOzKbSnJRaXYLl8XCxaFK8AfRe
   txIMIPBOwamTSiEFe38AEBAfuredwNtt5jC788cmD2kER8UouPkUp+UZQ
   QKAbdKeze0dOKPZkjfrdtoTEJCC8gaMFIruPYkThqHfMKP9XUznZaIJv8
   Kr3/8JqvfklsM+ILCgxIKYFkWxFO1Uyyu61N9Pl4HFCwvqj3yD4V9fsgC
   XVB/oCqlyb04BOho+xuGePSizP4bXmTTkfLFnTQEDzViR5CVHSSWiUHd1
   TM5tEz1urKXbOGenyoeaTeQgbOawVRri8+rLdoQkQUQiGkOHtg1a4aiTV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="375986348"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="375986348"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 07:50:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="831691131"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="831691131"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 07:50:48 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qdtrg-006y3r-0f;
	Wed, 06 Sep 2023 17:50:44 +0300
Date: Wed, 6 Sep 2023 17:50:43 +0300
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
Subject: Re: [PATCH 18/21] gpio: acpi: replace gpiochip_find() with
 gpio_device_find()
Message-ID: <ZPiRw5fyx3iZQMDx@smile.fi.intel.com>
References: <20230905185309.131295-1-brgl@bgdev.pl>
 <20230905185309.131295-19-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230905185309.131295-19-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Sep 05, 2023 at 08:53:06PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> We're porting all users of gpiochip_find() to using gpio_device_find().
> Update the ACPI GPIO code.

...

> -	return gpiochip_get_desc(chip, pin);
> +	return gpiochip_get_desc(gdev->chip, pin);

gpio_device_get_desc() ?

-- 
With Best Regards,
Andy Shevchenko


