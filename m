Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35D81EFFB3
	for <timestamp@lists.linux.dev>; Wed, 19 Feb 2025 14:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739975763; cv=none; b=K0QUjzgccQOJ6rJonT+ssOQSF+MsR08bQ/YjdcQm+kKz/UgPqciQUqexd8FpJGE6f0C/f7IjOpJQRsVQrRUGJCBFn+kmXOEkpFckSRgYzkI3EqaZOGGt+H44M9dWbwteviXTqNNDSLgobHF5rAXvUy9TaRYoNYJktmZ1INcNSb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739975763; c=relaxed/simple;
	bh=EH9pF0bmKJbUbYy6pLydxngVLwM8z/4zuVPHp1uETVk=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ETYlpxOLhtolMiJiVluYxH+/KtMHjtESYJm/1Q0eCOD3CwPNA8jialcEKkEKezYBIGwaEaDrW4aJkrAbEg/r27y0S01tDE+/zbX9Szr5OD6DTjzqg2SYpchfsr6uiNQzCOkUYHBrCpxmgaN2c7v+weh3+Ulm8cfbctE6et+abIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=TI4jefRw; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="TI4jefRw"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3078fb1fa28so61465591fa.3
        for <timestamp@lists.linux.dev>; Wed, 19 Feb 2025 06:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739975760; x=1740580560; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=SBUcuHhcoaE8QYDwj9P7DHCnYF+LbVz/GFms3n5h0yI=;
        b=TI4jefRwzUgL1JS9TJx8lrZbJkYCjDoWT8TRTBXfbAuv+iZu6JdAFWwjobBjZUDguz
         bOAW7pDygNMXA7727VjWcVIBl4cj/CPTsS+DnTRKZQmeeeZpXlBBmYFRrXQumFG0E5Vc
         dpIrNbXv+Rr4i0TGElM9O/kCzv8t3m+F4eRY0C9C0cMfSsIgcbkM7yYDZOdVPaOTx4tO
         33nlMSxBHDHtrXNZBwROylXIdy69P2JCmErKS30Rio/ycu0z1g7mIGIBfJ5FbcU6U6lL
         dPOw3ytIs4Edi9Y094P0j6t8ihaEObGKiQOqLH3XBI1EoxOfAj09IZCo8FwaILFPgTMs
         ouQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739975760; x=1740580560;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SBUcuHhcoaE8QYDwj9P7DHCnYF+LbVz/GFms3n5h0yI=;
        b=wn0fxnlwONsXoRjZoXOxAt1Svg92LEGFdvQCwiKBXxWCxiCsrmA5FDeW9Bk36wr/et
         cLuA/VoKgJrOqPyyjETvf6js7E+fnni+/Ahph6PICMss3o4M294A21wwm33tTGCJ4pmc
         IipFsx5vdjYv1zlY/p2cMsoGr32W81VJCG94koxl8TRZhP/e/xiMrnHQV+VpiV5MZA9K
         GbhXZ7IRh8WnpbBehOR8rVAt3C/WZnLdnIgMcG17fDtTDaC/N86Hl3zNQPGK0wTYyWNV
         SGduxCwTPpOHv4uSAcJZwu4YaJ+UivYtA1+tCGNGjdBi5wEjXlX/K345o+lJyHql+EkJ
         y9RQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVfgqqQpJXgEb/+uSjWbugAqSdrugiasXAMoctWDA7ec+6uSqV/hyi47jAfyJwurT7FwCj9MeKlW4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzy6F2irfCa/Wg05v1WIwNqpaKnzYsUVd32R+BL2T0HU0nTaiD6
	GYHQd2gxRrqf91DJdMbPsTkJxXW4DN9+jQO9JTJi91BkGKUDYXHlDn5hiBwXm+biIGvemJuH4VN
	R4W6XCQg/r1XHI9x+XYFiGwN/mJK0XcXhU5RiKA6V+zIeBX+2U8Q=
X-Gm-Gg: ASbGnctE8uyDG9OqdF1x21Egas3MvWNJ6lv2PoRgCpjZTBmPnoVYnqaoRp4MdAVEkKY
	1ikpniXErgv5JyPA+CJ34/8ocmRp/FXLy0kaTBmVjyEzc8w2SdXftTHNBJWOdF78EExeXPS63oP
	Hhbme15LYPJYNqCTTn3RFy68DABIE=
X-Google-Smtp-Source: AGHT+IGWf0KFGTQRiATMpVUQQe4aBiZSWkdJsR2tvlLkcSCO4pmtWlYPyfFpX+bXdzxU+JJPQ8UtLbjhTUd+ejUTMyg=
X-Received: by 2002:a2e:9cd1:0:b0:308:ffa1:8915 with SMTP id
 38308e7fff4ca-30927a62b9amr55470761fa.5.1739975759790; Wed, 19 Feb 2025
 06:35:59 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 19 Feb 2025 06:35:59 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 19 Feb 2025 06:35:59 -0800
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <Z7XPcYtaA4COHDYj@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250217103922.151047-1-brgl@bgdev.pl> <Z7XPcYtaA4COHDYj@smile.fi.intel.com>
Date: Wed, 19 Feb 2025 06:35:59 -0800
X-Gm-Features: AWEUYZlDfKC76FvJo02GQQdn2c3-Q0CRK_MYWCBSiSKiScyorPBTfditmsDbJu0
Message-ID: <CAMRc=Mf6HLoORvth1O=DLGXcSvq75-mbmPR0zXg6cm6VV-LVWA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] gpiolib: move all includes to the top of gpio/consumer.h
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Dipen Patel <dipenp@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	timestamp@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"

On Wed, 19 Feb 2025 13:32:49 +0100, Andy Shevchenko
<andriy.shevchenko@intel.com> said:
> On Mon, Feb 17, 2025 at 11:39:21AM +0100, Bartosz Golaszewski wrote:
>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>
>> We have several conditional includes depending on !CONFIG_GPIOLIB. This
>> is supposed to reduce compilation time with CONFIG_GPIOLIB=y but in
>> practice there's no difference on modern machines.
>
> It's not about modern machines. If every maintainer will think this way,
> we end up in the complete and utter dead end with the headers.
>
> I believe you at least had read the cover letter for the infamous Ingo's series
> about headers and how it speeds up the build (in some cases up to 70% on as you
> said "modern machines").
>
>> It makes adding new stubs that depend on more than just GPIOLIB harder so
>> move them all to the top, unduplicate them and replace asm/ with preferred
>> linux/ alternatives.
>
> NAK.
>
> This makes dependency hell things much worse and this is a step back on the
> untangling the current situation along with the slowing down the speed of the
> build. Please. consider to revert or discard this patch.
>
> ...
>
>>  #include <linux/bits.h>
>> +#include <linux/bug.h>
>
> Okay to replace, but not okay to move.
>
>>  #include <linux/err.h>
>> +#include <linux/errno.h>
>
> Please, double check that it uses error codes from it, otherwise err.h includes
> asm/errno.h with basic codes already.
>
>> +#include <linux/kernel.h>
>
> This is definitely no. Please, read what's written in the top of that file and
> here is just a proxy for should come in the future a kind of might_sleep.h.
> Do not move this one at all, please.
>
>>  #include <linux/types.h>
>

Fair enough. Does this look right to you?

diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index 0b2b56199c36..38e313fd0e9a 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -3,10 +3,6 @@
 #define __LINUX_GPIO_CONSUMER_H

 #include <linux/bits.h>
-#include <linux/bug.h>
-#include <linux/err.h>
-#include <linux/errno.h>
-#include <linux/kernel.h>
 #include <linux/types.h>

 struct acpi_device;
@@ -185,6 +181,10 @@ struct gpio_desc
*devm_fwnode_gpiod_get_index(struct device *dev,

 #else /* CONFIG_GPIOLIB */

+#include <linux/bug.h>
+#include <linux/err.h>
+#include <linux/kernel.h>
+
 static inline int gpiod_count(struct device *dev, const char *con_id)
 {
	return 0;
@@ -549,6 +549,10 @@ struct gpio_desc
*devm_fwnode_gpiod_get_index(struct device *dev,
 int gpiod_enable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags);
 int gpiod_disable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags);
 #else
+
+#include <linux/bug.h>
+#include <linux/err.h>
+
 static inline int gpiod_enable_hw_timestamp_ns(struct gpio_desc *desc,
					       unsigned long flags)
 {
@@ -615,6 +619,8 @@ int devm_acpi_dev_add_driver_gpios(struct device *dev,

 #else  /* CONFIG_GPIOLIB && CONFIG_ACPI */

+#include <linux/err.h>
+
 static inline int acpi_dev_add_driver_gpios(struct acpi_device *adev,
			      const struct acpi_gpio_mapping *gpios)
 {
@@ -640,6 +646,8 @@ void gpiod_unexport(struct gpio_desc *desc);

 #else  /* CONFIG_GPIOLIB && CONFIG_GPIO_SYSFS */

+#include <linux/err.h>
+
 static inline int gpiod_export(struct gpio_desc *desc,
			       bool direction_may_change)
 {

Bart
