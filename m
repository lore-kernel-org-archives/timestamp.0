Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7337A13AFA
	for <timestamp@lists.linux.dev>; Fri,  8 Sep 2023 18:07:15 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-99357737980so286227466b.2
        for <timestamp@lists.linux.dev>; Fri, 08 Sep 2023 11:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694196434; x=1694801234; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=subAUO9E8mZRv/6RLgXHnMS5iBnCJy0fu3qM36GnA0o=;
        b=ILmzz6fZDhsDBFz+F3s58G8OwMZiY2DIUtmlOcWxmSnvVeppRjMBeLyj9aUVSBhXVM
         qHuCDnCwlR0Dkyh5fZxZIJEcRaY32xdruq8Jgt3xjn7U2VyQAIir9DLP66JHbhpSxEfN
         ttJ3tuYSE9n7A4ENcOk+lbkaElTHptDnuq5N2kGqqSbtTZ9p7oyVOVkQrMSZm8AH5e0+
         LRCof/vlY6wYQPACQZFLRuOIaI2RySUQ5A/S+nzhP4P/Lk6BIDDMWPEVOIav6Q39tddb
         VhB17h2QK5Nt9LdTt64f27SfHJK6fUmto56rgo009AeV1i5/ZhpupIXF7sANGK1FGhc+
         spQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694196434; x=1694801234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=subAUO9E8mZRv/6RLgXHnMS5iBnCJy0fu3qM36GnA0o=;
        b=gTqxT1tZr8shuXuKG236Q0lnGAM7RnrihAk+EO0O+jAZ5IogfzIZlukmm95W1CEbO2
         1h0C1RriyObk0FL75+AyvdLqCiy3d5MWRdZ+gUtciNop2RV+juTLsd3BS4jGm1O4hUgK
         KRibOIOGQntv0nyMWwRTV4+nlS23A7EEWHT7e/Z1VdELgWRMJZx0vYK7o1JmOqj+yORV
         967i1Pc1bnhUpItJBb6UBndc+zIQk4bXMVdPqARNkZQkH0ikILbeOZGv8O3MVYOvo7LQ
         RuDvzkzn4BVUDFGF0frGX0BIN6o3WhocfbhhOwHThcuzrSO9/eGWC0IsXi32+197/w/H
         xNuw==
X-Gm-Message-State: AOJu0Ywh2L/Ns1KTycEc7GIaCx+Spcj5eD4TqKBtRc4GPJSQ8Lk95a/m
	1Ci7iHW0PRKiU4KqhbcTyDA=
X-Google-Smtp-Source: AGHT+IEBdgr1xof7hnEAV6QqzBERHOL9Ak0Vp3bXRIwbgu6y3tDfH9aHIemt2jhAqyAqEOA3aPEmIQ==
X-Received: by 2002:a17:906:2d0:b0:9a1:bd53:b23 with SMTP id 16-20020a17090602d000b009a1bd530b23mr2467057ejk.14.1694196433411;
        Fri, 08 Sep 2023 11:07:13 -0700 (PDT)
Received: from dell.localnet (77-255-201-154.dynamic.inetia.pl. [77.255.201.154])
        by smtp.gmail.com with ESMTPSA id a5-20020a17090682c500b00993664a9987sm1312081ejy.103.2023.09.08.11.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Sep 2023 11:07:12 -0700 (PDT)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Tony Lindgren <tony@atomide.com>,
 Russell King <linux@armlinux.org.uk>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Dipen Patel <dipenp@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Hans de Goede <hdegoede@redhat.com>,
 Mark Gross <markgross@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
 timestamp@lists.linux.dev, linux-tegra@vger.kernel.org,
 platform-driver-x86@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject:
 Re: [RFT PATCH 15/21] arm: omap1: ams-delta: stop using gpiochip_find()
Date: Fri, 08 Sep 2023 20:07:09 +0200
Message-ID: <6555932.G0QQBjFxQf@dell>
In-Reply-To:
 <CACRpkdaVUPNYVjAi2XsNKVhwmtk2qpVp62Lke4xeDOwhhBXLtg@mail.gmail.com>
References:
 <20230905185309.131295-1-brgl@bgdev.pl>
 <20230905185309.131295-16-brgl@bgdev.pl>
 <CACRpkdaVUPNYVjAi2XsNKVhwmtk2qpVp62Lke4xeDOwhhBXLtg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Dnia czwartek, 7 wrze=C5=9Bnia 2023 09:31:01 CEST Linus Walleij pisze:
> On Tue, Sep 5, 2023 at 8:53=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>=20
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > gpiochip_find() is going away as it's not hot-unplug safe. This platform
> > is not affected by any of the related problems as this GPIO controller
> > cannot really go away but in order to finally remove this function, we
> > need to convert it to using gpio_device_find() as well.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> I was cleaning this one just some merge cycle ago, now it
> looks even better!
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Acked-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>

Thanks,
Janusz

>=20
> Yours,
> Linus Walleij
>=20




