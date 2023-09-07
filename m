Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413E81116
	for <timestamp@lists.linux.dev>; Thu,  7 Sep 2023 07:31:31 +0000 (UTC)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-45070739316so243575137.1
        for <timestamp@lists.linux.dev>; Thu, 07 Sep 2023 00:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694071891; x=1694676691; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RuYVBuRk1qSk/vysKkYAGZLoaF4hP5KwSrbdU9HLCHc=;
        b=oY0kIivRHCYS1z7iElQ3az1ISlrO05lhJMbDjv0vMUBjbXn8PUJkza9uvPLLapAVqw
         x93YFeE6fgV3v7AC0EehwBnT+H7qwE0KIuR8W6EVTnyksi+DIQL1hHXznSERsVFAUr/x
         BN1ihIrLiW6DKe231E8nitWCAocFAMQvCNrahB5aglmGoZZEGkrzOrH6IBUvHr5HeMB3
         hKA9hqIUQD5OAUchXE0CYggRx+mrrRDSbCfs6AZoS7W4gf/ctqgmQkol3Izklydc+qVq
         YyvrWdTh/MR/UWzhB6oBYSx7HL/WmjcNPWoRvOhgCOj4Ki8XJxhsEUPsWbj+3yNGJub6
         lsdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694071891; x=1694676691;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RuYVBuRk1qSk/vysKkYAGZLoaF4hP5KwSrbdU9HLCHc=;
        b=iIuOUVdP4hMW7mr1qsK+MjWQyjY4qf5xOrO92y79/w89EypDAKUPsm3qMxhD0kABxg
         x56yT9X1hYoFQQxwXWtpwffsOCOt+2ZEsonsAEYWYeIt8Ct55SFByFcjg1BXfYFCOnEW
         yU/lTAatEWNUwWoWXnb/8VFDfusxnA+2PpOPiR3CjVqv3HKzS9X4QO8Z4gPx2oxzkf+Y
         NE+st+HXpyoPgeveFbce3eyC+cyWnn9UAMmjwr0GtxsmfVXxcbz651Eyo4sWyn/xmy9B
         2zJk/kbKTPTmAv+V7xJkZh3Acvn//fkYs0Kb0dHWT9I8x3PUSP0QhZeqFypt38xhIl+O
         SMAg==
X-Gm-Message-State: AOJu0Yw7Tn4t3kFSgTxetuwneXEE79NfLkVkkuV4PigfhqlFlMdDixGl
	Fn0HJO15bYpAiMEIucuBOQ2NTuil3UEp3CCPCI48Ww==
X-Google-Smtp-Source: AGHT+IFH+TTCwwws89F7SNPi0GGOZFWp/OkGv5hkCV0kl2J1CUqPAY/iOB9bwWhCU9n1g7MoTzaR/hVwP1cetSs2hGI=
X-Received: by 2002:a67:ebd9:0:b0:44e:a3e9:68d1 with SMTP id
 y25-20020a67ebd9000000b0044ea3e968d1mr5642709vso.1.1694071890893; Thu, 07 Sep
 2023 00:31:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-13-brgl@bgdev.pl>
 <CACRpkdYJhP5otaFXbn49sK_33GJMy85MszyD9rqoQT1-fqd9dA@mail.gmail.com>
In-Reply-To: <CACRpkdYJhP5otaFXbn49sK_33GJMy85MszyD9rqoQT1-fqd9dA@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 7 Sep 2023 09:31:19 +0200
Message-ID: <CAMRc=MdXU_EiG4iYhHJd7faRPEQ21hXHhRpPAqTa-TiMiraZpw@mail.gmail.com>
Subject: Re: [PATCH 12/21] hte: allow building modules with COMPILE_TEST enabled
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

On Thu, Sep 7, 2023 at 9:22=E2=80=AFAM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> On Tue, Sep 5, 2023 at 8:53=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Allow building all HTE modules with COMPILE_TEST Kconfig option enabled=
.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> This should be a separate patch should it not?
> Just send it separately to Dipen so he can merge it.
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>
> Yours,
> Linus Walleij

Dipen,

Can you just pick this up and the other patch addressing a comment in
a HTE driver separately? Would spare a resend to the list and I'd drop
it from the series.

Bart
