Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3570D514
	for <timestamp@lists.linux.dev>; Wed,  4 Oct 2023 12:01:10 +0000 (UTC)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4545d8a95d9so887318137.2
        for <timestamp@lists.linux.dev>; Wed, 04 Oct 2023 05:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696420869; x=1697025669; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5VxF9d0mojGG7o4cVpSUHCY76AoqXAbBRiV4n80jKEw=;
        b=x+NC6NyOLCwhC5oS1IHJSNjaYammlQLY3EQJl8qt7rJRn5gqyAU13lXrTy/fBi4FwO
         a0k275tXw5wuUqWfzHsvK0b/7uF6aZE3OQBgcm9CzmoOKWRAZ4PW1suWNei+xL0DVe4Z
         ImD5/DE5BURJmskiQyX3QZ8Brfd3ctdMazZAO0oex6YdCvoSBLI+s7+n28pgH9lpGraC
         6CbubQLB7W71HPP2uDNt8H0KI1ZaR2m6Nt9WbJC3fhWs6SBifBOg12DQEpE7kupYLJMv
         eT3mzMZRV8BAtQ6H60iClUrHmDEajYHgJYzJFZH0E9EiinFajOAVE/3Zz2mTRt1WipX0
         DQ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696420869; x=1697025669;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5VxF9d0mojGG7o4cVpSUHCY76AoqXAbBRiV4n80jKEw=;
        b=wx17pT19PrrDSNa6AmxSgFqIoL7nCDSQ1AWoLVSOcSN0Gb/+w/hqGTZeeUbUWtaSft
         DqWjN2/zDDFc3js3oSYUFXFDHLgFaBe0XxVXijxBPlid0LfmsxdR3uOpLe6F4TwlJu+G
         ssHTxNP6U6TYjFj5lAA+bl8Vtt7fsEpBCX/7MQgTlVxRDtt9YbvXcLr9KN8uu1kU1v5i
         UzkIQK10KCeM/3d+rNMiDyPX0KTVDLFjgN/WGZIaHhyhK7pq9ivrjgERFmHmkKur4raI
         +YihqL2X8qH7lp6GCCgVPUr6irlSvqrTOfQVKpV9BoAGZ0EZeNEXzZj87mm5r3w30kHQ
         bA0A==
X-Gm-Message-State: AOJu0Yzy8BR6fts8QgkTE32Fjfidgwp4PBpgCLLT6CgbFka3XwO7fs7h
	YksS34Nwft4zj/hMDjjD5pPxfiFW18zdk1WpnFjnPw==
X-Google-Smtp-Source: AGHT+IEx3AgtVmbiogi6y/J2HxxHzWhr7s02jCF0ZQyoHV8FsEEVFDac4kKEaiIaQ5/oedvf5e19/1rxUgniaHEkusM=
X-Received: by 2002:a67:efc8:0:b0:44e:9afe:c5b9 with SMTP id
 s8-20020a67efc8000000b0044e9afec5b9mr1545555vsp.23.1696420869527; Wed, 04 Oct
 2023 05:01:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-15-brgl@bgdev.pl>
 <CACRpkda9=VULj4Cy_sit-UpUQnVEbS-RJKAeULVCw8ZCRTq1sw@mail.gmail.com>
In-Reply-To: <CACRpkda9=VULj4Cy_sit-UpUQnVEbS-RJKAeULVCw8ZCRTq1sw@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 4 Oct 2023 14:00:58 +0200
Message-ID: <CAMRc=MdTk1B4MEh9C624Upm_EcaQgJd9OU-AGfU0G-DU1+qk6A@mail.gmail.com>
Subject: Re: [RFT PATCH 14/21] hte: tegra194: don't access struct gpio_chip
To: Linus Walleij <linus.walleij@linaro.org>, Dipen Patel <dipenp@nvidia.com>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-acpi@vger.kernel.org, timestamp@lists.linux.dev, 
	linux-tegra@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 7, 2023 at 9:28=E2=80=AFAM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> On Tue, Sep 5, 2023 at 8:53=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Using struct gpio_chip is not safe as it will disappear if the
> > underlying driver is unbound for any reason. Switch to using reference
> > counted struct gpio_device and its dedicated accessors.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> As Andy points out add <linux/cleanup.h>, with that fixed:
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> I think this can be merged into the gpio tree after leaving some
> slack for the HTE maintainer to look at it, things look so much
> better after this.
>
> Yours,
> Linus Walleij

Dipen,

if you could give this patch a test and possibly ack it for me to take
it through the GPIO tree (or go the immutable tag from HTE route) then
it would be great. This is the last user of gpiochip_find() treewide,
so with it we could remove it entirely for v6.7.

Bart
