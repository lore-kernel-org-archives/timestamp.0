Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7381116
	for <timestamp@lists.linux.dev>; Thu,  7 Sep 2023 07:25:04 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-d7b91422da8so589301276.2
        for <timestamp@lists.linux.dev>; Thu, 07 Sep 2023 00:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694071504; x=1694676304; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XvLrxMQ1IidFWYQv1qbOrK7Zz+kctFqLG1SqA3KCV8I=;
        b=KeHG1J+PYcrfedrnUIVtdIILW6YgprmYQTIFj+gwwdEucq49AG6bIe8VWI/lYZ1AVm
         MOK6Wi1bHuiLw5khzfaTEML6BMsZ5tmN2WHDSJSSJbjmF3Z5VQQvzUBPCuyS8OTYeApl
         hOAEmi5rVIKDlZTtI9RZDH5I1zq0Q9oorenXhi2BfFxix/CEd7oLDUfjaTrUa77VGutT
         +qvprwL1ZZKNdyWLQ5AyUvcFacm7DqkKPYybB+1nAnMSXzL70LzsuD7u3xnpzCFIEXBn
         Ntj/GTWcCyJkH8eU9hM0i3srfFduoHOCYP3KAG4Vnp+yKNFM1sWpU+ns7KghBu7hRFKL
         mGvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694071504; x=1694676304;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XvLrxMQ1IidFWYQv1qbOrK7Zz+kctFqLG1SqA3KCV8I=;
        b=Dasnl21ZICTqO4sX3P9j5b2CZAviVwnC9071aNegL6nQwq/QcSoAmTl+qzScG5OWJZ
         oEsEwH9XrAW0FuNHvL7LMU08gtMUV/ufpCDwDx7ZoLAOIDGOpi8Ep9atjzqU0ASvE3qM
         Isb+Td8vAvSK5ostau/ul73gRMkXUziPcpdbuQS1BWo3PCfFjr49duHQLrrxjOQQ7y9C
         b5OiZps1FLjnfemToa+I+iYnWh5lMIV7fm/QwlgSGPP47GoUk/C2RgZ7XKSO4kk1ysnQ
         +pQoKvGkl7IwQ1XIuHRTI6HgjaPU4dR8vhAg7Ylqeu+phAnQ4RSW1eFjp3KA41LeEJnM
         OzuA==
X-Gm-Message-State: AOJu0Yyxshf498Ik1+5vcAXDF4Mzk+a5AARct7ZL2VPcWitTHQX88o9w
	Jr37MODdS+c2qk0EfvjZ0CBGPnaahjETAZzuuBSibQ==
X-Google-Smtp-Source: AGHT+IF33BsQs6PXZBD6Yyx6MLxtC5D3dCLaevE9AUQBN2cYvO/VBix1ip+znuJz46jocHvadEET9qd1DQq8TKxIbhc=
X-Received: by 2002:a25:fc16:0:b0:d78:be:6f02 with SMTP id v22-20020a25fc16000000b00d7800be6f02mr17528083ybd.11.1694071503985;
 Thu, 07 Sep 2023 00:25:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230905185309.131295-1-brgl@bgdev.pl> <20230905185309.131295-14-brgl@bgdev.pl>
In-Reply-To: <20230905185309.131295-14-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 7 Sep 2023 09:24:52 +0200
Message-ID: <CACRpkdZE9hMWNeY=J0LrGTO1=83L46z69V6b7BX=Q-vaM3kBAA@mail.gmail.com>
Subject: Re: [PATCH 13/21] hte: tegra194: improve the GPIO-related comment
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
> Using any of the GPIO interfaces using the global numberspace is
> deprecated. Make it clear in the comment.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Split this off and send separately to Dipen.
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
