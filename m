Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B3E1102
	for <timestamp@lists.linux.dev>; Thu,  7 Sep 2023 07:00:33 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-d77ad095f13so571181276.2
        for <timestamp@lists.linux.dev>; Thu, 07 Sep 2023 00:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694070032; x=1694674832; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nAcaB2pTm5ugUpb7jItBu7GBa9HGPWbiLI0lhRjflAk=;
        b=PKNE9OnWOsX6rB8TnbB8e/kX1Y7x5gIWVySB3cYE24GAfPZlAsSKVM83eNAeX+3Rek
         PQGaweFZwkQx+Hl2W15GoPQzeuw0wpfiqJ+9XYMUMaAa34oiaBXE6m0WPo8netAbDQ0E
         Oc3vEIhyg1hDCCZ9eDWjvCH39dWjJHgJzajouvvYgPgICUBTdz2VLfTJ+UK9ePDHOEPM
         KEQvTZJMIQqPHmpdasnvxJDy2z8fc7cX1MMOee0sD2A75ngA0+S4T0gACWzppUjKpaMO
         GYXEyn5Ui5yiSebrf3yDWL3nEbRY7dCRPjgYSgwpvYxEho4NXjND0BoEWapciAIUwg0Q
         DsEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694070032; x=1694674832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nAcaB2pTm5ugUpb7jItBu7GBa9HGPWbiLI0lhRjflAk=;
        b=b1eakfyHHSaF5stTP1SBFby24Z45/DqsUCMsifmLYDqxjqRloNUSXLEl3bbPzhXsJZ
         CfsEoXzkkTuPRZ81qRqMtAqLVzg0mFRNATMdeL96O6bUBMpHe2bgzQqzk+1f2G9oDwKZ
         WrFL/xTK6TSxLORk+3tlrayaWiGCrZBnmzwLs+S83i4Mvb/qT9aCNVrLGuRRttkC3PRe
         oZqriq1oDWdpbhQHtSoKIw6KRubOC1syFLzLr3Twq6tWeWAXDhiqmJ7R/WJdJPRLfkSA
         ncEupW5FYxBjO13JH3Kp1QbAMllYfziraTnzAFEdg/SYpSK2DppXbpwZMdk5uVa0bLpF
         RQIg==
X-Gm-Message-State: AOJu0Yzxh1cPcmuu+ky1SEgz1eYb+bnlvNsWRNc1oq7vZHHp2TwdaONs
	DIwpBxqFrNOecR4LZJir/xzmm3RhZVljufxmgZtd8Q==
X-Google-Smtp-Source: AGHT+IG3iM5SVFsQBffezpzdNtWCyc5u9P9zQgzxCYNNrdFDmyZDKiMxM6k7I5B7BvMWEn22bFgEPztstkMTEryGy0M=
X-Received: by 2002:a25:e808:0:b0:d7f:ec57:bce6 with SMTP id
 k8-20020a25e808000000b00d7fec57bce6mr1114484ybd.26.1694070032245; Thu, 07 Sep
 2023 00:00:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 7 Sep 2023 09:00:20 +0200
Message-ID: <CACRpkdZFDMvyP=8hwH_ssUUEYbwyTATmbbXWQsZ2pqOh1Z9LNQ@mail.gmail.com>
Subject: Re: [PATCH 00/21] gpio: convert users to gpio_device_find() and
 remove gpiochip_find()
To: Bartosz Golaszewski <brgl@bgdev.pl>, Johan Hovold <johan@kernel.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Dipen Patel <dipenp@nvidia.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-acpi@vger.kernel.org, timestamp@lists.linux.dev, 
	linux-tegra@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 5, 2023 at 8:53=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> The GPIO subsystem does not handle hot-unplug events very well.

Yeah :/ it was never designed for this, and I've seen the discussions.

The person who made the biggest effort to make this sort-of work
was actually Johan Hovold so I added him to the mail so you can
include him in upcoming iterations. I think he was working with
GPIO on greybus at the time. Maybe he want to take a look!

> Before we can even get to fixing the locking, we need to address a seriou=
s
> abuse of the GPIO driver API - accessing struct gpio_chip by anyone who i=
sn't
> the driver owning this object. This structure is owned by the GPIO provid=
er
> and its lifetime is tied to that of that provider. It is destroyed when t=
he
> device is unregistered and this may happen at any moment. struct gpio_dev=
ice
> is the opaque, reference counted interface to struct gpio_chip (which is =
the
> low-level implementation) and all access should pass through it.

Thanks for looking into this. As I remember I have tried to bring down
this abuse over the years and IIRC it used to be even worse, it came
from the fact that all GPIO drivers used to be under some arch/*
tree and often loosely using the kernel GPIO API but in addition
providing a custom API...

> The end-goal is to make all gpio_device manipulators check the existence =
of
> gdev->chip and then lock it for the duration of any of the calls using SR=
CU.

Excellent!

> This series starts the process by replacing gpiochip_find() with
> gpio_device_find(). This is in line with other device_find type interface=
s and
> returns a reference to the GPIO device that is guaranteed to remain valid
> until it is put.

I agree with the direction and I see no major problem with the
patches other than some testing and cosmetics. The kernel sure
as hell looks better *after* this than *before* so once you have rough
confidence in the patches I think they should be merged and any
issuse fixed up in-tree so we get wider audience and can continue
the planned refactorings. So:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

I'll try to provide some detailed reviews if something stands out.

Yours,
Linus Walleij
