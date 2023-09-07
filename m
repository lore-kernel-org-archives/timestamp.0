Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621B5136B
	for <timestamp@lists.linux.dev>; Thu,  7 Sep 2023 07:37:54 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-d7260fae148so621229276.1
        for <timestamp@lists.linux.dev>; Thu, 07 Sep 2023 00:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694072273; x=1694677073; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vz1SpvYEblGQIUFOwvXI44dywFm7Krfl3gOSvV8SUSg=;
        b=k25x0wB6Ck5mAhodKSSUanUPGNft13Axd1PLOWb8UnxmG6XQSRoLL5Bk2Fkgl033wr
         9xM8qzbKwF8X5sSK+BebK+zNRAjvnYVpcXJMicUTXC1VvfhMeqj1V9qIGSXdpe45mBNe
         9gnYmMp58+yoBPOMfebzkurD1Lto9vIT9jh6tPjB1TAjOt41tcD2ZgnJWbCzokfHIqA9
         1e4bnN8GVT0o4VCw3gwOVpGMINaDmyMullbBS7rV9ux7ficmCTLzfzx2M5BvkVMpOd67
         IWjVjUSGX4/VgAFTxvxXJkUmjtyjZiu/p5C8mv2bZKmS0PYM/jTOhJfV5Lo4uNg3n2iw
         G9LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694072273; x=1694677073;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vz1SpvYEblGQIUFOwvXI44dywFm7Krfl3gOSvV8SUSg=;
        b=dibpPV5eMm8jvQKjV51epqqHhI4E+PUy66OvwomWQlcP5kCtkC4siFqQeqLzqiXrfJ
         6A/MY9CFgdnHiaq492PjLgkMre87H99ePUT+SyP0kIwdkLZzi/quCoUgonrihvAozFBr
         +u/MNo13YV1/pD1yJlBwkA+wi6BeXhay6Oo843uAiFjGr0bTEBg6N0NLC96Rp64aOFNa
         +Ck4T6dQDOyjDk2VhH+x9pV1VSMMWu27aGbx6lDnS5KuQdTJsqHYeinPVjQmfUJ0YPSn
         Pe9OZIabEtqKwJoj18knegeFYqOkAqCEeZEKMRV/Fq4QwGQgsxZmposUSmtuzFOPzkxj
         hGnQ==
X-Gm-Message-State: AOJu0Yw6q2N91H2x8FFz4sUdVzSawQWQ6jOtR7fDUaKKbaemww+CbQyD
	17bszkfYsbp5/ISrVc5azWjGu+id21vh4hFEhjix+Q==
X-Google-Smtp-Source: AGHT+IFX/4eyumxiC7nEFR+XPxzCJ5uyMTs6iy7ZgZ+cx415alKaYaIdPMXy/YLPsS1BT9j2oJ541saIGrDoN3xslRU=
X-Received: by 2002:a25:838b:0:b0:d35:f59a:6e46 with SMTP id
 t11-20020a25838b000000b00d35f59a6e46mr18424020ybk.49.1694072273274; Thu, 07
 Sep 2023 00:37:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-18-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-18-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 7 Sep 2023 09:37:42 +0200
Message-ID: <CACRpkdaq8jwYLWfqvmjJFyxRPktTSTt-FY_OoPQ-ymU3fFk41w@mail.gmail.com>
Subject: Re: [PATCH 17/21] gpio: of: replace gpiochip_find_* with gpio_device_find_*
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
> We're porting all users of gpiochip_find() to using gpio_device_find().
> Update the OF GPIO code.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
