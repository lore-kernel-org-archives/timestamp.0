Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F786AC0
	for <timestamp@lists.linux.dev>; Wed,  6 Sep 2023 14:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694011813; x=1725547813;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oXdfGzzZdVeNB8WOqcbJ3fq9pHu4f2PCymvo5LTc6HQ=;
  b=bYRz+TM30RI6vDaC9lOiKFI4sxppBJ//4xUGRVHDdxduzc3gBtkhgDRQ
   DMSjux5CeY7qWCKPqT17vm90xBOBIE/cNjuqrfoIwC13OmlzSV9zibdya
   wSb3/PRlMklwfJZTiSXmBzv3S8Oe0x+X3/Xvj2sV09rfuu2LJ3SmlBloJ
   r0OwPTZ6+epaS41yvVQxooDqau510/9+WdEzKjBZSmNWY3VXqA2rA6Dc/
   /6JMAIx5dIJJH3x1awBQ4f35LFY5cJRHTl/CjS45OufHKnFaHT80t10it
   mrBAK8n+wQBTs+EGqd3sjms/rKL0ra3u5lOqB/eHDQQTXJelEz7pjXHmJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="463461972"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="463461972"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 07:48:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="776642531"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="776642531"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 07:48:49 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qdtpl-006y2X-2X;
	Wed, 06 Sep 2023 17:48:45 +0300
Date: Wed, 6 Sep 2023 17:48:45 +0300
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
Subject: Re: [RFT PATCH 15/21] arm: omap1: ams-delta: stop using
 gpiochip_find()
Message-ID: <ZPiRTfN3ZbvcuE6I@smile.fi.intel.com>
References: <20230905185309.131295-1-brgl@bgdev.pl>
 <20230905185309.131295-16-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230905185309.131295-16-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Sep 05, 2023 at 08:53:03PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> gpiochip_find() is going away as it's not hot-unplug safe. This platform
> is not affected by any of the related problems as this GPIO controller
> cannot really go away but in order to finally remove this function, we
> need to convert it to using gpio_device_find() as well.

Side question, have you used --patience when preparing this series?

-- 
With Best Regards,
Andy Shevchenko


