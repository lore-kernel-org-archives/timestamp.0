Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE91B1116
	for <timestamp@lists.linux.dev>; Thu,  7 Sep 2023 07:42:20 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-58d70c441d5so6840627b3.2
        for <timestamp@lists.linux.dev>; Thu, 07 Sep 2023 00:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694072539; x=1694677339; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=13mPF61qHFznELBakOuaBROvGPz0+u+UN1db/TtYWeY=;
        b=WBSS2HY217TVecIrZFnlPNYAQ3lETNQ1iLm8Ttnk5uhMX8eh12EI7uVr4xvN/CiMtT
         HbSHiR95EAZvG9eA/ENehSKT+IxivgpoxBJtReuo09gJmCNPt2Vl6MRWxD2wFYauOIsN
         CukowxccGJZvqRQS9A6WmPIXcmMBxEtkNK590pBeWiXIPeyGYWIeJjl2UT96gt19JyEF
         4lyLr6lv/zVmVHErQf1p8J6Qbmz9ZqPMwIVCYc31jNDEM2WB0J8pMoEyAORI4EBbnYa5
         UhWX73MUi0A0c5IAklhwoIBolp7+SIe3TzSpWxXeEhaGmknS8DZMcjEkgIz0+cmxf/xj
         FhxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694072539; x=1694677339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=13mPF61qHFznELBakOuaBROvGPz0+u+UN1db/TtYWeY=;
        b=LGA1YakAycBHmaXTg/A6XYD0auTbo4CfBhM8Q8Mrp89sp4p+bnMF906utPJmvx++nq
         MqdPLAbkcWZ4rMXVr8KPc0DCIzP2x7gWhXWT4kMGj63gFQ0fOCzmTEOgpG3S8kj5gDYn
         sPrFzCrqY6P7klwTV4dTi0l9L6VrmxbqkTRZfkPHqEcsLhU/n/FvsucEHJEOk7fQsM7z
         ltuvJPhS+zVNSSYdRttFJgymMkgVAq1TC/WHPxtOhJIYJa5zPiPjWtI341lpNRKnjs0V
         CPJ0PZH4/uMUpUi8b2wIdzAqEUthH9swNqO8be/NR60KOT2Vd4MlLy6wkIVHaO1i4MK7
         VMow==
X-Gm-Message-State: AOJu0YxfEGT4da2AUrg++CwI7dsxaY3i60w5PoptQwYRAAxjmVB0uv5X
	IKBLRmVsHIQFh4vCDZ/fItkHJB4PQYSYXzSZTymfAw==
X-Google-Smtp-Source: AGHT+IEb93BSLJ6ys0EYsaB8W8EpvBdYT15JIdt6VJnTL5yTIvHPIi3k4AVOKcoqpkbYj81EENL5j+za7CaCpwJcXlw=
X-Received: by 2002:a25:d783:0:b0:d0e:b924:8e20 with SMTP id
 o125-20020a25d783000000b00d0eb9248e20mr19000067ybg.22.1694072539775; Thu, 07
 Sep 2023 00:42:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-22-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-22-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 7 Sep 2023 09:42:08 +0200
Message-ID: <CACRpkdZBa7SY=3vykMSOxcQ=z8=igru5uFmyVw0zmTBvAWZTBQ@mail.gmail.com>
Subject: Re: [PATCH 21/21] gpiolib: remove gpiochip_find()
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
> With all users of gpiochip_find() converted to using gpio_device_find(),
> we can now remove this function from the kernel.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This is so much cleaner, and introducing some scoped guards
along the way it's a clear win.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
