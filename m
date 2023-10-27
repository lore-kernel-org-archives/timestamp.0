Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB5D200A8
	for <timestamp@lists.linux.dev>; Fri, 27 Oct 2023 12:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fAjAHn8M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698410397; x=1729946397;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aHwDiflggT8QAz05/hvgP4SAkEJ7S7lNpOkSMXYalfI=;
  b=fAjAHn8MSZ2l0NsjjzKzOy+EwcsQTNylWNzM7eUsD6x4eAuGFhf+XFqv
   +IF35l+NfRjXClG+1G+LrmcfhdfXuQ3HVbse/imitJ0naM7UTP8Spxi7p
   yrWORIv1TcgQq9mSMFIUIH8f7H04pvx46xgBruR/6YbVx1+H79AGI7gHi
   OwoYGxRvfcAcrR8CMwpYhXwEQmSAPsit/XVUhH4n5GixCEvrIs9oc2Lvm
   gYAOhW+J9TxInixT8slp2j2yjQgSztSp4H9qVAMit+hebZQyXexMBkXr7
   idqeMnV0I0+YmbwHzXZ2cHDYiNrXldNzyqfZ8BSIAxdiUdHKOnIcSs6lV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="387582309"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; 
   d="scan'208";a="387582309"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 05:39:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="903264203"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; 
   d="scan'208";a="903264203"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 05:37:17 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC3)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qwM7q-000000098v6-45IR;
	Fri, 27 Oct 2023 15:39:42 +0300
Date: Fri, 27 Oct 2023 15:39:42 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dipen Patel <dipenp@nvidia.com>
Cc: timestamp@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] hte: Use kasprintf() instead of fixed buffer
 formatting
Message-ID: <ZTuvjqYXxWPyHrVR@smile.fi.intel.com>
References: <20231010141123.3909596-1-andriy.shevchenko@linux.intel.com>
 <59939570-3779-ef90-2a72-7be32a30e368@nvidia.com>
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <59939570-3779-ef90-2a72-7be32a30e368@nvidia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Oct 10, 2023 at 09:12:09AM -0700, Dipen Patel wrote:
> On 10/10/23 7:11 AM, Andy Shevchenko wrote:
> > Improve readability and maintainability by replacing a hardcoded string
> > allocation and formatting by the use of the kasprintf() helper.

...

> >  	hte_ts_dbgfs_init(desc->attr.name == NULL ?
> >  			  ei->line_name : desc->attr.name, ei);
> Reviewed-by: Dipen Patel <dipenp@nvidia.com>

Thanks!

Who is the maintainer of this code?
If not you, shouldn't MAINTAINERS to be updated to reflect that?

-- 
With Best Regards,
Andy Shevchenko


