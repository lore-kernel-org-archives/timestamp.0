Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B341DFE2C
	for <timestamp@lists.linux.dev>; Wed, 19 Feb 2025 12:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739968378; cv=none; b=mcqI8XwPcMD9w4n+3eukKpR9OqrJHetkiHErlEWQvmmyR8jCzhQCtTA03uWKGCS8C0SNsHqcO8NTewpXcKbXWY7BGZu+EsP3Zgh4XHEiQtqkbWZx8BLaPvxcpSVsxkhcY8hWymhSQ7AsBgfJKZjJrXy6BqIJHytpFSLtLa9LHvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739968378; c=relaxed/simple;
	bh=yDIUhMyqlYHrRY20nMSXqUJxRAG2s+oBiIMHyGosyBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UyzRKp0VTGqcD8vp2FNjwLLEHzd/QLykOoqCxHosRMgJZ1CQbWHf+e37cu5fqogZfP8HBfN0/U9QeAkcnT5lccSQ+Gmvg40LOt3BN6ThRRlF23n0xMnJXzcP+r6MRK4ECzTshWKXtIGFKUfftwkGKzDwHTRua44um+h7TiOqCoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bM6+fAxZ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bM6+fAxZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739968376; x=1771504376;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yDIUhMyqlYHrRY20nMSXqUJxRAG2s+oBiIMHyGosyBg=;
  b=bM6+fAxZB++yeqV8UW6TQCHQQN6MwzHRVu4gWabcOdznJNLd8sWmmhnH
   80KdkA932I8RuTRgMgUc6BOQ5R3nLz6F3apxmCwuZeyHzgpIM36NALisd
   y/OpS0kezFHNAMuA7lKTJHHZr6tdlSWjvIdmCQLZH8yqrrJaUASR/mK7C
   AyxKT+iTS6WjDa21rV9D1wCmtgktiBY5DUNQ9oaSycbbPDgyYNWIYcP5/
   UYgznkuWqOJp5VaWdbengxMW6ycYUxRCZ6yK7Durq95XBAblz0EX95DS2
   ggRqgcokQc42GzpnZTuwV1k8UNF72s2eNCENmKr0I5ehUvqOYPqZeCP09
   w==;
X-CSE-ConnectionGUID: 6hxWD83HQQSFbHBpQuo20g==
X-CSE-MsgGUID: pbQauNeZSZKcYpM7WP8v3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="44618013"
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; 
   d="scan'208";a="44618013"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 04:32:54 -0800
X-CSE-ConnectionGUID: P6SoXoDrS4CFvqkEzYPl/Q==
X-CSE-MsgGUID: ubcoNE6GTcOEyO+gJYZUDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,298,1732608000"; 
   d="scan'208";a="114622799"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 04:32:51 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1tkjFx-0000000D1RH-1Vab;
	Wed, 19 Feb 2025 14:32:49 +0200
Date: Wed, 19 Feb 2025 14:32:49 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Dipen Patel <dipenp@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	timestamp@lists.linux.dev,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v4 1/2] gpiolib: move all includes to the top of
 gpio/consumer.h
Message-ID: <Z7XPcYtaA4COHDYj@smile.fi.intel.com>
References: <20250217103922.151047-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217103922.151047-1-brgl@bgdev.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Feb 17, 2025 at 11:39:21AM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> We have several conditional includes depending on !CONFIG_GPIOLIB. This
> is supposed to reduce compilation time with CONFIG_GPIOLIB=y but in
> practice there's no difference on modern machines.

It's not about modern machines. If every maintainer will think this way,
we end up in the complete and utter dead end with the headers.

I believe you at least had read the cover letter for the infamous Ingo's series
about headers and how it speeds up the build (in some cases up to 70% on as you
said "modern machines").

> It makes adding new stubs that depend on more than just GPIOLIB harder so
> move them all to the top, unduplicate them and replace asm/ with preferred
> linux/ alternatives.

NAK.

This makes dependency hell things much worse and this is a step back on the
untangling the current situation along with the slowing down the speed of the
build. Please. consider to revert or discard this patch.

...

>  #include <linux/bits.h>
> +#include <linux/bug.h>

Okay to replace, but not okay to move.

>  #include <linux/err.h>
> +#include <linux/errno.h>

Please, double check that it uses error codes from it, otherwise err.h includes
asm/errno.h with basic codes already.

> +#include <linux/kernel.h>

This is definitely no. Please, read what's written in the top of that file and
here is just a proxy for should come in the future a kind of might_sleep.h.
Do not move this one at all, please.

>  #include <linux/types.h>

-- 
With Best Regards,
Andy Shevchenko


