Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF7EEDA
	for <timestamp@lists.linux.dev>; Thu,  7 Sep 2023 07:09:23 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-d7b9de8139fso528799276.1
        for <timestamp@lists.linux.dev>; Thu, 07 Sep 2023 00:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694070562; x=1694675362; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9b7v8ynf43I8EPh86qv2+Qihb/MMTTB3QC+Af1PR4Qs=;
        b=NEC4wcB7g2YXyLFUok2W9PN8jW1cbYe18XKzv1L+zxxw+lNxNtIorLyPsiMaOO4DZb
         TgldoslxTXYXSkf/vZUWPQw2FOCgUvOfksAD8z7Z+bkPZSEPVLiPbbiUrxvvHCznVuPj
         gA73teP8r8lpN0Lp7FEFNcLrygpt27rvikhhqEEsQ2/Ddq5NqukfgrCr8/IN7J4Rsbbw
         v1plGOAMvZRa6mfhHdeV8EWb8X16Xvcj7flDIriQOV88ywgOxZWuEt7XqkzrhFZ43g1r
         p4HbGvTDltuq5iHJX83MTAxHdshhuAgk5uGU3lH3k8Shti2M7Mq4vmHW1gbfb/E9TfcK
         5D5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694070562; x=1694675362;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9b7v8ynf43I8EPh86qv2+Qihb/MMTTB3QC+Af1PR4Qs=;
        b=ES6Sd6jlW6T99/BuMqt83SvLxh9DzCDK2D+1SAwvSofEVrSlh+D09LmNnw4U6fe9ON
         2md6jaM5/3U2m4CKAuaK92eKusDBEM9JxxfBq6xEsslEfO4b+jOt8laYR15t1UPPWKRj
         /cTqlJd9zfGoY9CJsluQT4A40eh/qoZyMtT4v+TJQgWUPNeb334Ij0e+Y9cWBVz0olHT
         x2a7opGlFS8up0Vtivm7BUpUV65UBN0Rn+XZ8fwsLiFV5RI++tGxC9iBWhhmUoiHSbp3
         q4nS0N0afCoV67/8SnGubx4G5rJ5Qhi7l34/c47d638lLIxiNpVdWYtUbSfdnriPgvmz
         gBgQ==
X-Gm-Message-State: AOJu0YwVotDqW/OyWUljqaDwGDFp4mGgvz8dTg81BbRcVJoVFlr/rMaj
	GTAO3PrbQIXSazkXYoc/CTMDwwye6VC6trrJHVh7YQ==
X-Google-Smtp-Source: AGHT+IFBMY2aVjLfU4IGVauVzzx/POp8es0I/Cix3TKhZtX3AA6hztSUPcllgbHHruPMjhuUvCKYwAD/N3CsJPq8yKo=
X-Received: by 2002:a25:bc53:0:b0:d62:6514:45b7 with SMTP id
 d19-20020a25bc53000000b00d62651445b7mr18630990ybk.37.1694070562057; Thu, 07
 Sep 2023 00:09:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-6-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-6-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 7 Sep 2023 09:09:10 +0200
Message-ID: <CACRpkdbAeBQj2RUjj9ybaAiytvtgpF4PXFvX+S4C0ZVP0bb8Rg@mail.gmail.com>
Subject: Re: [PATCH 05/21] gpiolib: add support for scope-based management to gpio_device
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
> As the few users that need to get the reference to the GPIO device often
> release it right after inspecting its properties, let's add support for
> the automatic reference release to struct gpio_device.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Needless to say, I'm a strong advocate for scoped resource management.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
