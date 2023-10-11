Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2454D15481
	for <timestamp@lists.linux.dev>; Wed, 11 Oct 2023 11:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BKtRgkNM"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-d8168d08bebso7056269276.0
        for <timestamp@lists.linux.dev>; Wed, 11 Oct 2023 04:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697024626; x=1697629426; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ms2vtbDlNLotZRA9zziKsDWimhPIOZieH9Xxbts9Gc=;
        b=BKtRgkNMN5IlnODSUcOTnQGCc6L9cjGpLdVQhn94xK3suzxCtqcXx0M8e8FIOhgYIc
         bekMooLJrS5ZOd0Qzqqm2mKJWohER+OYxv2P4giN0L86hmodI6RyHnDWKdT6ql/feyju
         1kATPojgs1J3DV1yy3Zf37+RlB5/m2as6JepSgm6Yk8MbijYd2vpL+KEyvTu8jQC7Dr2
         KcpCACFtOuXwwpbwiPeDDXlaDoQJkZIs15/2XndTTKkYPzMmvTbHb6gORF12UiPDZhHI
         P8HdPHYo/yTgR5+5qaIk20hvNbGqaUTN5r2Klswl7PX1jthLmix2PdMQlCPN9LpwyEzK
         UCnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697024626; x=1697629426;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ms2vtbDlNLotZRA9zziKsDWimhPIOZieH9Xxbts9Gc=;
        b=WjCVqTgrVKyEqqhhV2sP7o3cQUiab+VlS848fT8HpDF7v/fTrBvMjaIpkncp8Zd7gR
         CxwCVx5bTRTxwo3DPFrfJcwOS/h+g7BMCynqleb+u7dLjvdHjtpl5jcVIUQdF3XjXa10
         J1J1J4O5sNR1gxoDa9SVr0JZn82z72fYZ9zzsTBu6lYhfjCZ0HLVloLOY5/kQRhAhtQU
         dMtpWKv7vuBySd5KK8yY904R0rrB41+F5aWCXotHfpWx8YInv18yzeCySNxGA+1zcE5G
         lLCVrogxBhZLsVBbRfYQPyVsIBTpH0bvfLeJBL/uiJuxNM/bVvCSnfPhyI74EDTyvwQw
         UMTA==
X-Gm-Message-State: AOJu0YxybXLMSCUhH6v8wV/mXQ/1oDAUpSX8K1tiN3e7Y7DsxP6W4aG5
	VolNmVPwHe1qYFehLZKgwEVoi3lrk/JzH64KqbeCXw==
X-Google-Smtp-Source: AGHT+IGv903cvmdbSYh+DAb+5Tz4rULNvXAQTlBg+7mdFxAdgy0NyhnbXdLN6utN8XfBDPbmB7i+1uIbbVMACSQpBvk=
X-Received: by 2002:a25:ccc1:0:b0:d6b:6b53:d1ab with SMTP id
 l184-20020a25ccc1000000b00d6b6b53d1abmr19665014ybf.38.1697024626069; Wed, 11
 Oct 2023 04:43:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231010151709.4104747-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20231010151709.4104747-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 11 Oct 2023 13:43:34 +0200
Message-ID: <CACRpkdbEzT-VWOP26oDWc7YE=t_wNOJKo=CfQxZ-vk5Rsmzt8A@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] hte: Improve GPIO handling and other cleanups
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Dipen Patel <dipenp@nvidia.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	timestamp@lists.linux.dev, linux-tegra@vger.kernel.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 10, 2023 at 5:18=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> This is a series provides a new API to GPIO library (so far only
> available in the GPIO tree), and respective update to the Tegra
> HTE driver. On top a couple of other cleaups (patches 3 & 4, they
> can be applied separately).
>
> Patch 2 inherited tags from its respective discussion thread [1],
> but I believe the Tested-by needs to be confirmed again.
>
> Due to dependencies this either should be applied to the GPIO tree,
> or to the HTE when GPIO updates land the upstream (optionally with
> the first patch be applied even now to the GPIO tree independently).
>
> Another option is to have an immutable branch or tag, but I assume
> that was discussed and rejected (?) in [1].
>
> Link: https://lore.kernel.org/linux-gpio/20230905185309.131295-15-brgl@bg=
dev.pl/ [1]
> Cc: Dipen Patel <dipenp@nvidia.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>

This is good stuff. The series:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
