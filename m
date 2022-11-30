Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48AF7A42
	for <timestamp@lists.linux.dev>; Wed, 30 Nov 2022 09:01:02 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id i131so20664140ybc.9
        for <timestamp@lists.linux.dev>; Wed, 30 Nov 2022 01:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cbVbgsH3XRTQv4786z5ER1yQeEoNdKbadkVm9l1r2WM=;
        b=jpfGnLgK/1cG6bBQcrKLMuOQiKzdWPOvTlsnIw4uqyLKQB3Y35J6A+P9dz0cdrlcqL
         HZhqFeQZeMvQvtxffy0pO4SFOOtTnfGiHz1pI4HXacAFsoCyixjxNkZeTRAkvwOWNt8H
         0oFPHx+yka4PGucML2TC7WFhenIczYDCYPuKrGShpC2xUii2XIkDcdTbN6tX7QI7hU6d
         Z3jHz5Ke9gOYxM1shAuaNoHaGfnqgBrSo0Lc/qVPlibA/20nT3U+BgiwxJlNmeAO0Y1x
         fZyiy16VZspf44UMuMkocJp6vfI/JNBdV1uvZzKxBJXgccR5LLuX1gMY3az9/Lp36mzj
         jdCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cbVbgsH3XRTQv4786z5ER1yQeEoNdKbadkVm9l1r2WM=;
        b=sw9gw2hcrwoiiRAV1Cbb3Sdo5OlZ9NnAmArv2SHa5ZomY2PuCpKgYZME2ziIJYnUzP
         4xrACtC3IU+m1x/b462K6+cEGY9AEPzO4uPw0MK//ivT9C0VrRcm5p8KRjxDiQk1JDa4
         /tDMh1WkxacSHSATla9K8p6OEkwqitOrQkf7vHrVFQ/uepBWElHlC8A3C4OjF0LUGTiW
         8xvJnO6Mpc5rN9DzH96UNDv27fmrvxP9g5pWGhR4SsM3PncQhlmXtA0/Ht1aE8VB8bAR
         RVFUSDmcRvY79eiZi6eVwJboHYzsOrlFCL6VGBMpKk1FwU417lERRITIPg/jkNvlu7+5
         BsJA==
X-Gm-Message-State: ANoB5pkFuX0y6linWeK9HHDLP+5FiExrU2bfG5PHP+BoTKjoPtQF4tu3
	yXgG1GWedIwyCAlu9VIOzI9oKncXefbUQ8mgpNM06g==
X-Google-Smtp-Source: AA0mqf5nvJFCwC+Bm8UuGEcbvyqnBNs8xlBIAHq6KVDu3vmowiOFuVe2nCDzI5eQr+k/J/6u/NaNpmdNaQvvxoaXX/I=
X-Received: by 2002:a25:a241:0:b0:6ee:e865:c2e2 with SMTP id
 b59-20020a25a241000000b006eee865c2e2mr36593660ybi.206.1669798861231; Wed, 30
 Nov 2022 01:01:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <BYAPR11MB3240F382BD180FF90C7DF0B9E1069@BYAPR11MB3240.namprd11.prod.outlook.com>
 <7de35859-97ab-8e88-f590-d5851b81773b@nvidia.com> <BYAPR11MB32405F4FA22BB47BD03C8F18E10C9@BYAPR11MB3240.namprd11.prod.outlook.com>
 <CACRpkdbY5aU3OTufA0q+N7Pwm0shGgnjScAGR_96oo9XdgBDhQ@mail.gmail.com> <BYAPR11MB3240CE6547117D138B1A112DE1129@BYAPR11MB3240.namprd11.prod.outlook.com>
In-Reply-To: <BYAPR11MB3240CE6547117D138B1A112DE1129@BYAPR11MB3240.namprd11.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 30 Nov 2022 10:00:49 +0100
Message-ID: <CACRpkdbOPbqot+Yf6i_EayPrRn2S+ZTA1FzZ-0OkjXjR5UZvqw@mail.gmail.com>
Subject: Re: Intel timed i/o driver in HTE
To: "N, Pandith" <pandith.n@intel.com>, Johan Hovold <johan@kernel.org>
Cc: Dipen Patel <dipenp@nvidia.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"Hall, Christopher S" <christopher.s.hall@intel.com>, "Gross, Mark" <mark.gross@intel.com>, 
	"Sangannavar, Mallikarjunappa" <mallikarjunappa.sangannavar@intel.com>, 
	"D, Lakshmi Sowjanya" <lakshmi.sowjanya.d@intel.com>, 
	"T R, Thejesh Reddy" <thejesh.reddy.t.r@intel.com>, 
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, 
	"timestamp@lists.linux.dev" <timestamp@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 29, 2022 at 7:10 PM N, Pandith <pandith.n@intel.com> wrote:

> Intel  timed i/o is mainly intended for couple of functionalities.
> 1. Input event capture with timestamping

I understand this part, and it is handled by the HTE subsystem.

> 2. Generate single shot or periodic pulse train
(...)
> c. Most importantly, precise time synchronization between devices/sub-systems
> Ex : Share precise time from a GPS receiver to the network or
>        Synchronize processor clock with external signal.

So I think this is the actual use case of the output mode. The
pulse train output by HTE is to share precise time to GPS receivers.

So what about putting that part into drivers/gnss?
GNSS Global Navigation Satellite Subsystem like GPS etc

If this is the only usecase, that is where it should go, along
with the serial or whatever transport driver is used with the
GPS. I don't think this is a generic functionality (such as
GPIO) at all, but rather a very application-specific use case
which will only be used for GPS time synchronization.

If the timed output has other use cases - and I mean HAVE
other use cases, not COULD HAVE other use cases - then
we can discuss generalizations. There is no point of designing
upfront abstractions that never get used.

Yours,
Linus Walleij
