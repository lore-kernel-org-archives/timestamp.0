Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C611116
	for <timestamp@lists.linux.dev>; Thu,  7 Sep 2023 07:31:13 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-d7820f9449bso639209276.1
        for <timestamp@lists.linux.dev>; Thu, 07 Sep 2023 00:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694071872; x=1694676672; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uhjMO+NmlnkrwuQTWTc/YRBA9QtXdjC/hl8DIJEpExk=;
        b=tuIejAcysUfVdN+eHKOo2Qhi7MaeqGVwzqaH7tSgbog3xEeJR0cuIw9B2ejKz9yuGB
         Uyxrpb4du3YbAjL6Ee6MIgyfDU2m/TP8I1iI6Hlic0Ry1hLFCSHBl+B4sjOeHhjJ1R8Q
         RSCv4X3tHQ/LMnPar0R8Y9cC/qI8gmDMIrR3rJ6263VnsguU38OleCLdBWSl/PHpb0kE
         YCPvrIULXHnlxfyRAx6ED8XFS4ZIKoThSzKO/sK1b56fZnmmcINOPR+upxxMI2nAuqAC
         GcV6svDCerOiDd/Gy8c6cknwFw8DJXj0tVyZOIkFq1qjok3j+02WovpUPkLGksp/5Pe2
         TOCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694071872; x=1694676672;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uhjMO+NmlnkrwuQTWTc/YRBA9QtXdjC/hl8DIJEpExk=;
        b=B83e/qM3Uqow84AOvtk9G3UfkiQFx5D/9WraSzxDWE294YBUbE4bARU4GFuguZolhx
         x6CpCOvs9rggQFod0yKKRE7Df1juYDePqi4Ke5ezGuEZVK0Di2SV2siymlZ0Qf9hkTtr
         tHRnd42NJHl1sgEhMvKmrhFHmuj/lBEsWb7UjjFZ/WzhtLPD6vXTfsmy3uNHpnTcRF6P
         zrbxqGupx6Rdk5tm6GkemSeTtCnVm9Y9fmCJLF9so/VDMM0po9i4Svr2E8JrTLmBzz0F
         CfsrWqesG5ktrTbEK7vAM4UMfDznKhCWHI1170qf1yUJumH+JE3SERMwQY69CeQIO4R6
         s47Q==
X-Gm-Message-State: AOJu0Yx5xaFvHIEdMqWCny5lKA/NtH4Y8OQFGissu4wjcC8lWJ/IGNI5
	e8vy+GrVecCKUKm40j7+thZRvgDXAEJKeXQlbQmCew==
X-Google-Smtp-Source: AGHT+IEos+IWcRlRURBpWq2f/yqX4JwD1uUNGc4FMcBDjtB4EYVZgMX+6wsZb6/oamwVKLnZoLMvxAzj5BAJ8/qIfJs=
X-Received: by 2002:a25:aad4:0:b0:d7b:9ac8:f439 with SMTP id
 t78-20020a25aad4000000b00d7b9ac8f439mr18109140ybi.40.1694071872125; Thu, 07
 Sep 2023 00:31:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-16-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-16-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 7 Sep 2023 09:31:01 +0200
Message-ID: <CACRpkdaVUPNYVjAi2XsNKVhwmtk2qpVp62Lke4xeDOwhhBXLtg@mail.gmail.com>
Subject: Re: [RFT PATCH 15/21] arm: omap1: ams-delta: stop using gpiochip_find()
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
> gpiochip_find() is going away as it's not hot-unplug safe. This platform
> is not affected by any of the related problems as this GPIO controller
> cannot really go away but in order to finally remove this function, we
> need to convert it to using gpio_device_find() as well.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

I was cleaning this one just some merge cycle ago, now it
looks even better!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
