Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD7F63B6
	for <timestamp@lists.linux.dev>; Sat,  9 Sep 2023 14:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694269077;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gxpqjGlWGczKrjdD/KSIdC9Ij7lXDy76wdf60gzXu/U=;
	b=B9jfQhFzwDi3Q8Yfp0zGb5maNh67iYw+S2K6EiWfvf0oKXVU7+zpcAizvlVmuLz8eUZOaq
	uWPYLvwQ5gtBREixOZRi6BxsjNzm77ioHJiPC9iTazlSj5WbL/POzftEZnAHTao1+F1999
	zo1ldzLi3BNyqZhh+9j3hDN+h7rys+U=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-497-_YErG6sVPBiN72rYz8bmfQ-1; Sat, 09 Sep 2023 10:17:56 -0400
X-MC-Unique: _YErG6sVPBiN72rYz8bmfQ-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-997c891a88dso201066166b.3
        for <timestamp@lists.linux.dev>; Sat, 09 Sep 2023 07:17:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694269075; x=1694873875;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gxpqjGlWGczKrjdD/KSIdC9Ij7lXDy76wdf60gzXu/U=;
        b=M/9GZRv7DGalYct6yZpTEPVWae9gutp+TG9LMbgAXkHcuBS2Q2g1GKdSm7yrH27Afq
         1RIeoEdKHNIqqjn5NeAEmMIm3gWayDxO50nEjA+valXEP9bq5WbLiOfeeCz5UHRUKlgN
         w8VtJrE65SKOfWhDFHscYzKzkD2TTxtUyXvNbPXxG5Q7w+DH6BAEfF+b8xbCyLuBbHLn
         tUnvp5nyx7uWr55XIzVUgDPt3WJhzKWcfeQApr4y1yTytgwE/LroqSRq4TxlbJs2oXda
         0ict+mWpij8jS+KNK0VVeiDrtiet+hc/9r73NLXJ1KzbeshMo5Bq5ervACnDtceDZs6j
         q17w==
X-Gm-Message-State: AOJu0YyXfHo7LSgkcHWFJQY9m5bp6hF6L72XnVWISFELwR63W88CP6fe
	Sp0eumBO9TRKprjOln3qCTPzSKIrMiySIiCzrlKQbateDXl9Fe5yDfvtt33jYEa8axeQ6QQRzSp
	mVmnCFVdCGe75nneDT4yB
X-Received: by 2002:a17:906:1099:b0:9a1:bb8f:17d0 with SMTP id u25-20020a170906109900b009a1bb8f17d0mr4501446eju.30.1694269075507;
        Sat, 09 Sep 2023 07:17:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMudyVp+zx8RzmnPFLHESTvoKIZa2tIOu9EV9hDpsbWpIlbA1KAhUYJhR+ZESN38YSVQ+qMw==
X-Received: by 2002:a17:906:1099:b0:9a1:bb8f:17d0 with SMTP id u25-20020a170906109900b009a1bb8f17d0mr4501420eju.30.1694269075146;
        Sat, 09 Sep 2023 07:17:55 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id i10-20020a170906114a00b00992076f4a01sm2396508eja.190.2023.09.09.07.17.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Sep 2023 07:17:54 -0700 (PDT)
Message-ID: <173bdafa-08da-7473-6711-61131986eb3c@redhat.com>
Date: Sat, 9 Sep 2023 16:17:53 +0200
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFT PATCH 11/21] platform: x86: android-tablets: don't access
 GPIOLIB private members
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Russell King <linux@armlinux.org.uk>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, Dipen Patel <dipenp@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Gross <markgross@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-acpi@vger.kernel.org, timestamp@lists.linux.dev,
 linux-tegra@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230905185309.131295-1-brgl@bgdev.pl>
 <20230905185309.131295-12-brgl@bgdev.pl>
 <8f51b4a8-bb9c-4918-61a8-4ab402da1ed0@redhat.com>
 <CAMRc=Mfmp3Nd5jwNWr=kc8RFO-arFDwEvLxj5Qu9_1OOXR2gHQ@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAMRc=Mfmp3Nd5jwNWr=kc8RFO-arFDwEvLxj5Qu9_1OOXR2gHQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Bart,

On 9/6/23 16:27, Bartosz Golaszewski wrote:
> On Wed, Sep 6, 2023 at 3:01 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi Bartosz,
>>
>> On 9/5/23 20:52, Bartosz Golaszewski wrote:
>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>
>>> We're slowly removing cases of abuse of the GPIOLIB public API. One of
>>> the biggest issues is looking up and accessing struct gpio_chip whose
>>> life-time is tied to the provider and which can disappear from under any
>>> user at any given moment. We have provided new interfaces that use the
>>> opaque struct gpio_device which is reference counted and will soon be
>>> thorougly protected with appropriate locking.
>>>
>>> Stop using old interfaces in this driver and switch to safer
>>> alternatives.
>>>
>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>
>> First of all sorry for the issues this hack-ish kernel module
>> is causing for cleaning up gpiolib APIs.
>>
>> I don't know how close a look you took at the code, so first of
>> all let me try to briefly explain what this hackish kernel module
>> is for:
>>
>> There are some x86_64/ACPI tablets which shipped with Android as
>> factory OS. On these tablets the device-specific (BSP style)
>> kernel has things like the touchscreen driver simply having
>> a hardcoded I2C bus-number + I2C client address. Combined
>> with also hardcoded GPIO numbers (using the old number base APIs)
>> for any GPIOs it needs.
>>
>> So the original Android kernels do not need the devices
>> to be properly described in ACPI and the ACPI tables are
>> just one big copy and paste job from some BSP which do
>> not accurately describe the hardware at all.
>>
>> x86-android-tablets.ko identifies affected models by their
>> DMI strings and then manually instantiates things like
>> i2c-clients for the touchscreen, accelerometer and also
>> other stuff. Yes this is ugly but it allows mainline kernels
>> to run pretty well on these devices since other then
>> the messed up ACPI tables these are pretty standard x86/ACPI
>> tablets.
>>
>> I hope this explains the hacks, now on to the problems
>> these are causing:
> 
> This makes sense! Maybe we'd need a good-old board file setting up all
> non-described devices using the driver model?

Right, this is pretty much exactly what the x86-android-tablets
code does. Except that it does it for a bunch of boards in a single
.ko / driver. There is a lot of commonality between these boards,
so this allows sharing most of the code.

The driver uses DMI matching, with the match's driver_data pointing
to a description of which devices to instantiate and then the shared
code takes care of instantiating those.

About 90% of the data / code is __init or __initdata so both
the code to instantiate the devices as well as the per board
data is free-ed after module_init() has run.

<snip>

>> So rather then the above I think what needs to happen here
>> (and I can hopefully make some time for that this weekend) is:
>>
>> 1. Have the x86-android-tablets code instantiate a
>>    "x86-android-tablets" platform-dev
>> 2. Have the code generate a gpiod_lookup_table for all GPIOs
>>    for which it currently uses x86_android_tablet_get_gpiod()
>>    with the .dev_id set to "x86-android-tablets"
>> 3. Use regular gpiod_get() on the "x86-android-tablets" pdev
>>    to get the desc.
>>
>> I think this should solve all the issues with
>> x86_android_tablet_get_gpiod() poking inside
>> gpiolib external since now it is only using
>> public gpiolib APIs, right ?
>>
>> One question about 2. there are 2 ways to do this:
>>
>> i. Have the module_init() function loop over all
>> x86_dev_info members which will result in calling
>> x86_android_tablet_get_gpiod() and have it generate
>> one big gpiod_lookup_table for all GPIOs needed
>> in one go. At which point x86_android_tablet_get_gpiod()
>> goes away and can be directly replaced with gpiod_get()
>> calls on the pdev.
>>
>> ii. Keep x86_android_tablet_get_gpiod() and have it
>> generate a gpiod_lookup_table with just 1 entry for
>> the GPIO which its caller wants. Register the lookup
>> table, do the gpiod_get() and then immediately
>> unregister the lookup table again.
>>
>> ii. Would be easier for me to implement, especially
>> since there is also some custom (board specific)
>> init code calling x86_android_tablet_get_gpiod()
>> which would require some special handling for i.
>>
>> OTOH I guess some people will consider ii. somewhat
>> ugly, although AFAICT it is perfectly ok to use
>> the gpiolib lookup APIs this way.
>>
>> Can you please let me known if you are ok with ii,
>> or if you would prefer me going with solution i. ?
>>
> 
> I am fine with ii. I have recently sent a patch that does exactly that
> in one of the SPI drivers. It's ugly but it's better than what we have
> now.

Ok, I have just finished implementing this using the ii. method.

I'll post a patch-series for this for review right after this email.

After that series x86-android-tablets should no longer be a problem
wrt using any private gpiolib APIs.

Regards,

Hans



