Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFDBA32
	for <timestamp@lists.linux.dev>; Wed,  6 Sep 2023 14:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694011956; x=1725547956;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=inkf0Vv2sw3e1+dq2vxBlduL5A9wIEDv+hfvFclNOlw=;
  b=lhz8i0OpUaS2zVpT+SyjiePGOldW+j2t6rVCVKyRwMgEZzsoWJ3BXj95
   mkT0Avdc7MxdgKFbjGAx0mr5ZQBsxoT7ErrZ1Mv/2VJZdkLYUzUGH6Fsd
   HGhKpL1WnHtBzdK2T7Df+gA5W9v0c1U1MIWZ0i2tNBIH4uVVnPb6K5Jaj
   /p4WNGutQ32n0WLQuQA7WB6PDhLNtI516VhWyrhFnuUFUQAvK0vpqqQjX
   YNpXIz7+yIX/2AnmBidxqUwW1kSiUrpTUJ/A64+qNvrom8+sYnnsytAqQ
   rAs57XopctTeHRSpUHWT/V+dkHWXPVO6MP0fUpa2CklNixGpFvSyrm5lX
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="362116760"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="362116760"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 07:52:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="735086303"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="735086303"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 07:52:29 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qdttJ-006y5B-3D;
	Wed, 06 Sep 2023 17:52:26 +0300
Date: Wed, 6 Sep 2023 17:52:25 +0300
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
Subject: Re: [PATCH 19/21] gpio: swnode: replace gpiochip_find() with
 gpio_device_find_by_label()
Message-ID: <ZPiSKTfIU3BSrqTj@smile.fi.intel.com>
References: <20230905185309.131295-1-brgl@bgdev.pl>
 <20230905185309.131295-20-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230905185309.131295-20-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Sep 05, 2023 at 08:53:07PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> We're porting all users of gpiochip_find() to using gpio_device_find().
> Update the swnode GPIO code.

...

> -static int swnode_gpiochip_match_name(struct gpio_chip *chip, void *data)
> +static struct gpio_device *swnode_get_gpio_device(struct fwnode_handle *fwnode)
>  {
> -	return !strcmp(chip->label, data);
> -}
> +	const struct software_node *gdev_node;
> +	struct gpio_device *gdev;
>  
> -static struct gpio_chip *swnode_get_chip(struct fwnode_handle *fwnode)
> -{

Not sure if you used --patience. Patches might look better.

> -	const struct software_node *chip_node;
> -	struct gpio_chip *chip;
> -
> -	chip_node = to_software_node(fwnode);
> -	if (!chip_node || !chip_node->name)
> +	gdev_node = to_software_node(fwnode);
> +	if (!gdev_node || !gdev_node->name)
>  		return ERR_PTR(-EINVAL);
>  
> -	chip = gpiochip_find((void *)chip_node->name, swnode_gpiochip_match_name);
> -	return chip ?: ERR_PTR(-EPROBE_DEFER);
> +	gdev = gpio_device_find_by_label((void *)gdev_node->name);
> +	return gdev ?: ERR_PTR(-EPROBE_DEFER);
>  }

...

> -	desc = gpiochip_get_desc(chip, args.args[0]);
> +	desc = gpiochip_get_desc(gdev->chip, args.args[0]);

gpio_device_get_desc() ?

-- 
With Best Regards,
Andy Shevchenko


