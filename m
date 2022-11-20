Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43C42F2B
	for <timestamp@lists.linux.dev>; Sun, 20 Nov 2022 22:33:54 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id p81so3981259yba.4
        for <timestamp@lists.linux.dev>; Sun, 20 Nov 2022 14:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Nv+M9JLErYIuqpEJrx3jYZjNp1otlxlEOydAF6yu7ts=;
        b=KdYBUjtQ78WAwpkKFAdrq1i8V9OJyZkN2IVbP3L5yW8MqFJh9WXNDOGRT/nSldRjRo
         1qabr363Bqlk/m98zXhxj96Eb+P9y6DbpZ+MjCWkMEZCMssBH999FBC8T3R3R3FNZREV
         gA8hNJJlpVqEY24acpDmrYIsRZQF3Aj7bxSH/nMSWJt/hmBeouyOUvwLcSTTiZkR8eSY
         jJG76WQlt/+gdOV6Bxg8y4jO2Eo6psooO+3OwGPhmcgs1HyU616i70hZLalwe4u9Xguy
         M4hR38VivS13Yj9Ut2uoyzf5ebtSD7PGHT5a0eZ6Ti1XogT1m5hOrp3sdWlQPqS17Ale
         6uNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nv+M9JLErYIuqpEJrx3jYZjNp1otlxlEOydAF6yu7ts=;
        b=kPLmCEVD4uZiTnHuUB+SrotaNGkCgOiPKm3Fe6nr+hoMblpS6vRQOY2RtHKkRjAYMZ
         2ru3eSXdP47a3ByMccKBgZ0sgDI0h0+KkTVvoMf/3Ifn/Q/8pQ0LPEKvQtu/5zSEYrgx
         2iDzb8xNcxNhQSRWO9To1/oLQI34pZu1qpUcGaiTYQxaaryqLfuLWKrV0yyZntlcjsa8
         Ick5sjc9l9d31LuoQyYADS6nvuFvDQnROF+NrjfNIaIIo5y176GqeSmgFdR02ikHOk/x
         7/YWYBhw7nINtnXA/Qkejv0cg93XqephdRKIp2BT3wXzxh2NwWsdUEB4ZV7+aYawcwS+
         siNw==
X-Gm-Message-State: ANoB5pnT1QMseY527hr7tMpxqFRwd8N3UpxNq6D1AI2liXMEpuf4fhdF
	s6R5B+k64oCE5cxhqhskE0B6dEgqX80pnk2VjUoKDQ==
X-Google-Smtp-Source: AA0mqf4oaYEs6nyurYgDspJUitDASblVPhkFdzdzfLsurUJhkpJRnfsTFSueaJYVZt1Ws5024Q4gARHV2JCCZskFj9A=
X-Received: by 2002:a05:6902:4e8:b0:6d1:16bf:1f8f with SMTP id
 w8-20020a05690204e800b006d116bf1f8fmr1609540ybs.206.1668983633802; Sun, 20
 Nov 2022 14:33:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <BYAPR11MB3240F382BD180FF90C7DF0B9E1069@BYAPR11MB3240.namprd11.prod.outlook.com>
 <7de35859-97ab-8e88-f590-d5851b81773b@nvidia.com>
In-Reply-To: <7de35859-97ab-8e88-f590-d5851b81773b@nvidia.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 20 Nov 2022 23:33:41 +0100
Message-ID: <CACRpkdYrF9O+nJZkH+EVP=3gvdKBrnf11gTVh-xzKjPFk1EHfg@mail.gmail.com>
Subject: Re: Intel timed i/o driver in HTE
To: Dipen Patel <dipenp@nvidia.com>
Cc: "N, Pandith" <pandith.n@intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"Hall, Christopher S" <christopher.s.hall@intel.com>, "Gross, Mark" <mark.gross@intel.com>, 
	"Sangannavar, Mallikarjunappa" <mallikarjunappa.sangannavar@intel.com>, 
	"D, Lakshmi Sowjanya" <lakshmi.sowjanya.d@intel.com>, 
	"T R, Thejesh Reddy" <thejesh.reddy.t.r@intel.com>, 
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, timestamp@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sat, Nov 19, 2022 at 3:33 AM Dipen Patel <dipenp@nvidia.com> wrote:
> On 11/17/22 10:47 AM, N, Pandith wrote:

> > To support Intel timed i/o driver, it was suggested by Linux community to enhance hte framework.
> > However, we see some limitations to support complete Intel timed i/o device.
(...)
> >       b. Timed output  - single shot or periodic pulse train.
> >       Uses TSC(Timestamp counter) for timestamp or generate events, which could be translated to system time.
(...)
> For 1b, the timestamp part can be added as hte provider. I see opportunity to enhance hte framework to provide
> translation facility between the domain, system time in this case. However programming interface to facilitate
> timed IO output can not fit into HTE the way it is right now. May be one possible way is to enchance HTE with API something like
> hte_configure_timestamp_periodic/timed could be possible in which case HTE does something more than just timestamping the event.
>
> I have to see how in GPIO case that proposed API works out, if it will bypass gpio framework etc...
>
> Adding Linus W into the discussion....

I think I already answered with some open ended questions in discussion
with Christopher S. Hall:
https://lore.kernel.org/linux-iio/CACRpkdbeQ_67V3jkw_-KfTwe54TxrK_LA7N8Nwj1qEpTELN9dQ@mail.gmail.com/
https://lore.kernel.org/linux-iio/CACRpkda63TNWLdTjY+_xxXb4df4qCZi1EaXL3pXK=+Hon-0RLQ@mail.gmail.com/
https://lore.kernel.org/linux-iio/CACRpkdYxverx-KsG9URrh5qkEFXDknZKCE6RM555mjOuC--vMg@mail.gmail.com/

I think Intel is in a bit of uncomfortable design space with this thing that
isn't fitting properly anywhere. Dunno what to do about that :/

One thing I didn't get a clear answer for is what kind of use cases the
timed GPIO is for. I was suspecting things like stepper motors. I was
suspecting at one point some kind of sync pulse to something. But
no clear answer.

It is useful to know the usecase to be able to figure out the appropriate
subsystem. It might be that GPIO with some custom ioctl()s for
the gpiodev is the right answer to some of the question, as outlined
above.

and I see Dipen has some answers:

Yours,
Linus Walleij
