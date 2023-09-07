Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BE8136B
	for <timestamp@lists.linux.dev>; Thu,  7 Sep 2023 07:40:33 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-d7820f9449bso645158276.1
        for <timestamp@lists.linux.dev>; Thu, 07 Sep 2023 00:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694072432; x=1694677232; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Rz9GiS8mTfnAVkN8QSO49dpqTEISv8k2Dk2MfoLtSg=;
        b=Bd1h8vm7cAEPeS6hJ22fTEkLKjxgkYUcB8bpEP0vdPXvcXJA4JN/juki6WDYGzG5g+
         YLzFdxIQLQ0M6FfCN3JitXJODOSn9ocd+G9rXiToF6GKmil1zehPwfiVXjzJT0twiDKd
         0JlBhf9MFi5fgLLs1HNNDLwSoE4Ujw2NjV77sufezyXDJrID9JCPomTtoE/y+a7uHiKt
         LHEPEM9nzYUI4yAK6QmJj1f60m5ybtzV22rpLrTExNiId63yfolYgNuqkCNiEHV9jQUN
         oPWagxiGSF8KagbrrNx1yPeR2JM7D5ef1zYkmCWf/keBaX+KXwXicyf0k4QLmZisps3v
         yvfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694072432; x=1694677232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Rz9GiS8mTfnAVkN8QSO49dpqTEISv8k2Dk2MfoLtSg=;
        b=fj+j37Ulu9ZXDgnB2xVLd8PGku6NxHDNACAu5+iiDRG0ktsvb79ImrvPRt3Ftn5g21
         yNsEPCgW/ABLe0rERa9TjPDof1AGdXAeVSNMxyWOp3CX/6dNX3ZgZgr3cOcJZBa9FHy1
         j+hB6XkFg9rN6/EMeXLnPQ8TaDPmILNQrfLGgrenfsf6TgVWQ+1Ds0d+RX/plSo9BFqm
         i53Z/s+ajSPu1Ve9wdyJFHI8cvHs7Ew4GfxiSJtHO6sNmoPFbOmfsJv6OFakXKTX3Gpp
         PWCqZDb5Q3eH9tCkuDlwTNCjHgkJ/JlKqqryDcolA4YMOjVaC7pkYG3fRapxc9EPsHay
         qeXQ==
X-Gm-Message-State: AOJu0YxBKoM4ManIW1PqyveM5sld8recQDbV+vkz7bJrzM7Mxkkgybwj
	ChNzrx5bvg22ReVYq7hy242PC9+y+gMRBLLXAGGxBg==
X-Google-Smtp-Source: AGHT+IFnux13voMEYKL2AvFFZ2IntVTZOtmPk8jRTbyWfstIdLEdj42EUj9cU8dCaEOekjzsm7vjd98pJPwVLSbOMrc=
X-Received: by 2002:a05:6902:120e:b0:d78:1b39:fd03 with SMTP id
 s14-20020a056902120e00b00d781b39fd03mr22126055ybu.64.1694072432520; Thu, 07
 Sep 2023 00:40:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-20-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-20-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 7 Sep 2023 09:40:20 +0200
Message-ID: <CACRpkdZkPbvDTMo_ZOJ8rZ5+dUOqOi2_EfS+jzreWjMtpJrVYg@mail.gmail.com>
Subject: Re: [PATCH 19/21] gpio: swnode: replace gpiochip_find() with gpio_device_find_by_label()
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
> Update the swnode GPIO code.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

With Andy's comment addressed:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
