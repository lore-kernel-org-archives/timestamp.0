Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604C2EDA
	for <timestamp@lists.linux.dev>; Thu,  7 Sep 2023 07:07:07 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-d7e6d9665bcso576698276.1
        for <timestamp@lists.linux.dev>; Thu, 07 Sep 2023 00:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694070426; x=1694675226; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I18DoVxRqFJaTqip4HKub/TPXgj9WnWp7a45EaJWvuM=;
        b=jKfOxcOB1R1sl/MVXaj/D8Y8VmWOrxsBi2xrF9Asqb0eBUPeZpeRwBQoejk2fb3rgP
         PHJmpntxrPtBcQTOeKuawtNLmLHjtrUIsPgkZJLzsu2tABu3cU6Fgy6P2P2UnFu7/Gsa
         Ez+zgJDCVBDA/r7UpKbfjPAWLiencCsxo6DHUzYKus9fVboOdtCmDA4LyZs+TO8vjsHq
         Bj29dthMbBAjTxuJA6hwCjBMX8l4b/DGWRc3PxA7GTJJMpgn2wc9zJW2u3IiiSFeUHqn
         3S1F5PiaLp+eqTpz/jR4QmxlcBIONBHYlEsQyZA4dZwMW/uL8kDsU4jNpphGIFb462UR
         HFTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694070426; x=1694675226;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I18DoVxRqFJaTqip4HKub/TPXgj9WnWp7a45EaJWvuM=;
        b=Tn0OcZY/I3rMrHcFAz4xEaS6b18hbebsWFAaagFJjFTHDm3+A/FW3vpHRrzpqtjIhf
         MlUE3FzC+3JlU3rUEWkZMw8aII2KfMJSE3RJXtcOaWqDvSCzKoe2cO8hjZx7fLi9ER1l
         XXvL4dB6+n4vTRfpgU999W2Cch0yZc/il+qwXPkNePqX9WPEogxBSVDuPgZFfqJYFgYm
         LV0rkzm3Ie5qx6bAmTPwSAHzlJEjz4/m/m5chG77/pHcrkyAW2LGSVjKAx3sH6Z4R7aS
         ZEWhQjfU236fKIAh+y7oVewNtI4XGSrJK7qs4Pz/smXYfSKJozwFjJ9/FvRTfGzIS6es
         YU4Q==
X-Gm-Message-State: AOJu0Ywl6scOHPj9PGEVp2zXLzvcySBJeJUOiS2aHwQSoMVvxwBcE+Tt
	8AI0l4lMxAVey5XC4tLkQ/y9+G6Mrjg7lJKsgBTp/A==
X-Google-Smtp-Source: AGHT+IH52ZmMDQle74d5+xBv94alRH/CYtL/TIhLKM9b7HFrce/j3cJJJRCz5BcoTZ3hxH+Wxp8LvqydUyq2rr0UgjU=
X-Received: by 2002:a25:5f0d:0:b0:d7b:90c6:683c with SMTP id
 t13-20020a255f0d000000b00d7b90c6683cmr17866183ybb.26.1694070426178; Thu, 07
 Sep 2023 00:07:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-4-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-4-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 7 Sep 2023 09:06:55 +0200
Message-ID: <CACRpkdbE5AJHiGan_oj4_kBSOh7okfwM0u9qDcEyTBr+NCO=wA@mail.gmail.com>
Subject: Re: [PATCH 03/21] gpiolib: provide gpio_device_find_by_label()
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
> By far the most common way of looking up GPIO devices is using their
> label. Provide a helpers for that to avoid every user implementing their
> own matching function.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Yeah this is what everyone and their dog reimplements.
Good to centralize this.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
