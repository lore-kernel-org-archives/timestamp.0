Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A375D513
	for <timestamp@lists.linux.dev>; Wed,  6 Sep 2023 14:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694009879; x=1725545879;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QX645dZFdhQ+ioOhTLWdP6mcq9wvGo1tSmPXl3L039c=;
  b=gNC90ADs/1zsHVsvjoBzDKmx5jLNyf5f/G4HmtXCobgbijx41RdUogVt
   2VW/NVvzj8DTgRfmHYS/6Uv2JjmHCRweHd6dcb5dzroLWFd0/ve0h6Fbg
   Mbb3Z1ux7FVHoXPrlTJpE4c2NzmruOZWDsGD06ZOb3BNWk7Cgi760VtVx
   yPMCMkgbk75ShhHVFAjBPdqXoauxBtYfY1EnP7tdJ60B3vUtYinOmjcYD
   DuipNCjZ4oqgLfON3DLkcKWqtRuXBWjOu1iXfdjbc21z542cXbnoSkeax
   P7EJrKMuW7EMSAS0s/xKLsHaonT6qKXZdht4tjkDZKwobyzVN9osloIik
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="380873575"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="380873575"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 07:17:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="741562051"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="741562051"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 07:17:52 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qdtLo-006xeT-2c;
	Wed, 06 Sep 2023 17:17:48 +0300
Date: Wed, 6 Sep 2023 17:17:48 +0300
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
Subject: Re: [PATCH 06/21] gpiolib: provide gpiod_to_device()
Message-ID: <ZPiKDOg+dyesjaz8@smile.fi.intel.com>
References: <20230905185309.131295-1-brgl@bgdev.pl>
 <20230905185309.131295-7-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230905185309.131295-7-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Sep 05, 2023 at 08:52:54PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_desc is opaque so provide a way for users to retrieve the
> underlying GPIO device.

...

> +/**
> + * gpiod_to_device() - Return the GPIO device owning this descriptor
> + * @desc: GPIO descriptor
> + *
> + * Returns:
> + * Pointer to the opaque struct gpio_device object. This function does not
> + * increase the reference count of gpio_device.

GPIO device.

> + */

-- 
With Best Regards,
Andy Shevchenko


