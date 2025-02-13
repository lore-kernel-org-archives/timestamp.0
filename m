Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B792066EB;
	Thu, 13 Feb 2025 07:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739432819; cv=none; b=dt1PaosOsaTEu2AXJVGgIC9bVs0RMCIX9XAmlSS0iiQU5AcYNndKeEjwPS42YP7DNlOfH34Q0DL106LaE0gHVFu/oMEDbKUvol5dQ5J2MyWKODt/tbwnjsDQaqc4C7YydTreqK5M7dmnLguBQ7VkE35v519/JRxHwSuHJlld3nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739432819; c=relaxed/simple;
	bh=VCg0jRUPuHhvK6NR4yFDct642+Q4OOO7b3q05KJjBto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VU6lgw5w7pEl27Yj9Lag4u1GKNzEVUhBA1fSUaw1w2D2/5isBqQVkYjCVsX7c5E3Gr1grn8z9SyViq4ckUcgzw99F3mRSCeUc22+dT24rQvyDhLRcLOOkyBc7NX9irvwotN3ybNI6QyBeUqztfIVRm9L7c56dWxXQC54x+T3sUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=laEKuuLu; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="laEKuuLu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739432817; x=1770968817;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VCg0jRUPuHhvK6NR4yFDct642+Q4OOO7b3q05KJjBto=;
  b=laEKuuLucaL4BNNDsm8qyNPHyq4AI8buLig2xjgfWzwjpdxPz+3vP55Q
   D3acFl2HVBOOF4yAow4wpN49rpnMLXZeGtOoUTHWlEajgvDS8sTewnyUm
   +X5/dH/S1rMm4Yk6dvdadBlk8Y1nZC8xTH/aQhxGXBXrS5zbLytTMJOwh
   SZ/T6afAnUuVIcZL49xJOklk4ch+gpZzsRCPS2iYDapQlgs2qRAkBDCw3
   vlkHBDzqTJbW67ipjViPhJ0OmiJ3QHKvrUpPY0p3PnSGqqipw3U8aTB1Y
   C26lq/gw8GXbZmcpqiJyfiMyu3saiFdTpaGJmHbh+Is3TjKITvLL/+5PF
   w==;
X-CSE-ConnectionGUID: e2ct0hhOSu6IBVIycqkCBQ==
X-CSE-MsgGUID: gL32ef61T4KuJa/ijxfm0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="44052163"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="44052163"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 23:46:57 -0800
X-CSE-ConnectionGUID: crQpVo6fSqWK8Vul4++oLA==
X-CSE-MsgGUID: YDT/1sVUQNSgEtE0fWU0Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117680964"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 12 Feb 2025 23:46:55 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiTvw-0016k4-2r;
	Thu, 13 Feb 2025 07:46:52 +0000
Date: Thu, 13 Feb 2025 15:45:59 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Dipen Patel <dipenp@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, timestamp@lists.linux.dev,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2] gpiolib: don't build HTE code with CONFIG_HTE disabled
Message-ID: <202502131503.gMZldZLL-lkp@intel.com>
References: <20250207083146.17872-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207083146.17872-1-brgl@bgdev.pl>

Hi Bartosz,

kernel test robot noticed the following build errors:

[auto build test ERROR on brgl/gpio/for-next]
[also build test ERROR on linus/master v6.14-rc2 next-20250212]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/gpiolib-don-t-build-HTE-code-with-CONFIG_HTE-disabled/20250207-163408
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20250207083146.17872-1-brgl%40bgdev.pl
patch subject: [PATCH v2] gpiolib: don't build HTE code with CONFIG_HTE disabled
config: i386-buildonly-randconfig-001-20250213 (https://download.01.org/0day-ci/archive/20250213/202502131503.gMZldZLL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250213/202502131503.gMZldZLL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502131503.gMZldZLL-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/reset/reset-gpio.c:3:
   include/linux/gpio/consumer.h: In function 'gpiod_enable_hw_timestamp_ns':
>> include/linux/gpio/consumer.h:557:17: error: implicit declaration of function 'WARN_ON' [-Werror=implicit-function-declaration]
     557 |                 WARN_ON(desc);
         |                 ^~~~~~~
   include/linux/gpio/consumer.h:559:17: error: 'ENOSYS' undeclared (first use in this function)
     559 |         return -ENOSYS;
         |                 ^~~~~~
   include/linux/gpio/consumer.h:559:17: note: each undeclared identifier is reported only once for each function it appears in
   include/linux/gpio/consumer.h: In function 'gpiod_disable_hw_timestamp_ns':
   include/linux/gpio/consumer.h:567:17: error: 'ENOSYS' undeclared (first use in this function)
     567 |         return -ENOSYS;
         |                 ^~~~~~
   cc1: some warnings being treated as errors


vim +/WARN_ON +557 include/linux/gpio/consumer.h

   548	
   549	#if IS_ENABLED(CONFIG_GPIOLIB) && IS_ENABLED(CONFIG_HTE)
   550	int gpiod_enable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags);
   551	int gpiod_disable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags);
   552	#else
   553	static inline int gpiod_enable_hw_timestamp_ns(struct gpio_desc *desc,
   554						       unsigned long flags)
   555	{
   556		if (!IS_ENABLED(CONFIG_GPIOLIB))
 > 557			WARN_ON(desc);
   558	
   559		return -ENOSYS;
   560	}
   561	static inline int gpiod_disable_hw_timestamp_ns(struct gpio_desc *desc,
   562							unsigned long flags)
   563	{
   564		if (!IS_ENABLED(CONFIG_GPIOLIB))
   565			WARN_ON(desc);
   566	
   567		return -ENOSYS;
   568	}
   569	#endif /* CONFIG_GPIOLIB && CONFIG_HTE */
   570	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
