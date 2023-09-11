Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F9FBE67
	for <timestamp@lists.linux.dev>; Mon, 11 Sep 2023 11:10:07 +0000 (UTC)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-450b8d61550so298367137.0
        for <timestamp@lists.linux.dev>; Mon, 11 Sep 2023 04:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694430607; x=1695035407; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ygzI44NeTHTXZv1CATzGbcxyMKxYdJM78sd/Ui4mbh4=;
        b=1+xhWIkhSj2/L/1zDYfGQd0GCgoKqZQiu4Dw/fN3U5QXjA4/4mLqbVHfqZ0Wv4bO2y
         LNjfdquhxqhq5HeDfclJ1ZG2VnoIDeSMFQ1hvRLwrrZf9jKZDN1dKTG1C6e0yp5RBEGw
         fjdm+MO09+qNb7YPnWUP1qQTF72DwBAo7uBpTkoL5E82ljoPGkIX+0wey2MTZlr5yWxp
         ZQYVSMhdYlk5kzofCjFmSHYCmImAU57N+qdrqmU8ShVrY3f2p7D+QKjvEy3R5Kyxw+zO
         zWeHFFDoV45dPXBWXiYrlUN4JSJlQmj+E/aPMlCdBUiOpzFbHDNFIDMt/Izid4bOsyte
         CZuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694430607; x=1695035407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ygzI44NeTHTXZv1CATzGbcxyMKxYdJM78sd/Ui4mbh4=;
        b=mjXxqJP2XQLR0SDaUQU/z6+ZGJkmVKqgRxgSU+nzGdp2tAv0J8gdp9nBeC7JyaXmSN
         DgDGJS5e21zCf0utDnZh5BgX1NPnpaaQYg1aJqMUP8DeqaOboSog+eSh5VkVeiwgZWuL
         KXRFOf9c/LO9k07obagDIbND5OFZxmxakH76V4RPIViXaq6MjhFfKR5jvRcK+gv0yPeH
         XMslMYtbJcd6kxOosuQMDOhlaUqyLEjCJUStjZVNrv+l4mzO38ubpai78u3XTItTmgjK
         wYpMypCm105cfmKjqdIz4hp7MP/gGYHnLyxsXvXPGL8cTUYfuFNKKHFunWOUngGtz7bj
         0H0Q==
X-Gm-Message-State: AOJu0Yz9iH+PG0jIJEiz7TH9AvwDFlGLG2vjZUNpLW3VhIKVfCEAbAjh
	wHGsBd7fHGl61wY1jBf59dEjI9q6jFMKYVqkdgVfmQ==
X-Google-Smtp-Source: AGHT+IHKoGdBmULT8rxuDZNFn4KOQlQw0ew3QXPEPQ2cSj+YIXX/HcTVOBuC3A6SmscStWmmEPnPXA1WJ+6yAFCejlE=
X-Received: by 2002:a67:f557:0:b0:44d:5b62:bcd5 with SMTP id
 z23-20020a67f557000000b0044d5b62bcd5mr8865170vsn.23.1694430607044; Mon, 11
 Sep 2023 04:10:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-16-brgl@bgdev.pl>
 <CACRpkdaVUPNYVjAi2XsNKVhwmtk2qpVp62Lke4xeDOwhhBXLtg@mail.gmail.com> <6555932.G0QQBjFxQf@dell>
In-Reply-To: <6555932.G0QQBjFxQf@dell>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 11 Sep 2023 13:09:56 +0200
Message-ID: <CAMRc=Mfrk9q6fJyEAuxDXYPpbjVHeLJaTjHEcKiYHzrE3r+_7A@mail.gmail.com>
Subject: Re: [RFT PATCH 15/21] arm: omap1: ams-delta: stop using gpiochip_find()
To: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
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

On Fri, Sep 8, 2023 at 8:07=E2=80=AFPM Janusz Krzysztofik <jmkrzyszt@gmail.=
com> wrote:
>
> Dnia czwartek, 7 wrze=C5=9Bnia 2023 09:31:01 CEST Linus Walleij pisze:
> > On Tue, Sep 5, 2023 at 8:53=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.=
pl> wrote:
> >
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > gpiochip_find() is going away as it's not hot-unplug safe. This platf=
orm
> > > is not affected by any of the related problems as this GPIO controlle=
r
> > > cannot really go away but in order to finally remove this function, w=
e
> > > need to convert it to using gpio_device_find() as well.
> > >
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > I was cleaning this one just some merge cycle ago, now it
> > looks even better!
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Acked-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
>

Janusz,

Is it fine if I take it through the GPIO tree?

Bartosz

> Thanks,
> Janusz
>
> >
> > Yours,
> > Linus Walleij
> >
>
>
>
>
