Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE1CEDA
	for <timestamp@lists.linux.dev>; Thu,  7 Sep 2023 07:08:06 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-d7f0a60a159so534672276.0
        for <timestamp@lists.linux.dev>; Thu, 07 Sep 2023 00:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694070485; x=1694675285; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h2UPY8Ad0JyZ552HHQpe1k1G4pRk3wLhmWob6nvmGZM=;
        b=hGyDsfLSfOCPT4BwtVSiaKjHbbLLZ+31LPke8blNJ+9LUwxBZCFRA4eT8aD1PY6R99
         /3buZi0yJ7KGf9bjJclTnaLOtYdzJ7j5DefBfdA0zY8z5p/hPIMKlLJWQivs4/eIlDUA
         N/m+UKy2rSfXWMzNNJpnr6aarqmF6XufPKUcUjn5LKVPWLlTD7abKmtqJ7AspBKzkuL6
         boiNAEF0QTPTrwaQaJK5rZ2y6HyB6eCBGqL10gL1mvX9wJtWieEmE8xGwigFRaLoVmRv
         uSFNGD1yeVGKtAaJz78z0fUFOI9mlDaEmw/KChrI8eNX6celY9nBOeoEgYMpZXgGa5UC
         GY1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694070485; x=1694675285;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h2UPY8Ad0JyZ552HHQpe1k1G4pRk3wLhmWob6nvmGZM=;
        b=WkSaNC0MtpGRSswY9QbbpEpN17647EzMkZ/XtAJzBS8o50doWbYyoxDHBTc0GODIK6
         gSou/7OPtrgnVOq5yjjdRGQwL7XWED2vUZjbMf6h2W/c6dz6wePGfhdSc1hhUgzbz3L7
         zWCVrBkqt/DD1dR7dSRiis0bIBU/9temLCfMd+YMZK7nxirsrQQpTcbkdJtzGbHx0x1t
         ZzONy7wR/DmRS3o80772HjwHrESxWz5KThj7gwtKfEpzpWuLFv3Fk01G7hhVRPBNiBNG
         wxaV+hgVRf16brgq4378PfW0Xq2wmchuVOLGV8qEAHeXwjZXwqx2/p7UmGH61rqNvQPe
         +xKQ==
X-Gm-Message-State: AOJu0Yxl2in+xyV/ulBzuW85Y6w8C/T6JMmIKXAsStErcvSw07lXGD+R
	yoU6PFPiz1g34wd0vnlFPh5Fita4IH0HYcNVj5xdiQ==
X-Google-Smtp-Source: AGHT+IFxuGmnz6UhP+iDHBaAUw7EFN+gVZSw6nwdZwmmFMJ3XnkMU5k7fxCuPngY53Trr0s6Te5MkJ1CXk5K8y+Rwo4=
X-Received: by 2002:a25:ce47:0:b0:d1d:514e:27c6 with SMTP id
 x68-20020a25ce47000000b00d1d514e27c6mr18577035ybe.6.1694070485563; Thu, 07
 Sep 2023 00:08:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-5-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-5-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 7 Sep 2023 09:07:53 +0200
Message-ID: <CACRpkdYCOVJZ6TUMQQHSaKZHMCx8tE8=3z=1BogYTkr52mFr8Q@mail.gmail.com>
Subject: Re: [PATCH 04/21] gpiolib: provide gpio_device_get_desc()
To: Bartosz Golaszewski <brgl@bgdev.pl>
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

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Getting the GPIO descriptor directly from the gpio_chip struct is
> dangerous as we don't take the reference to the underlying GPIO device.
> In order to start working towards removing gpiochip_get_desc(), let's
> provide a safer variant that works with an existing reference to struct
> gpio_device.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Andy had some good doc comments, with these addressed:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
