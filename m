Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227B4320A
	for <timestamp@lists.linux.dev>; Thu, 23 Mar 2023 08:38:46 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-544787916d9so382776947b3.13
        for <timestamp@lists.linux.dev>; Thu, 23 Mar 2023 01:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679560725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y1cIEqXClsIkjDNlYez3V926czPhumNF8sofNyJFFdA=;
        b=eUTIHwb9gHiKe80gCXINbKnZwZKRxQ9pCErWt8YiVhFdExfyg6azrWWNruAziA3WY5
         +Sm+oMyhOCxn4XhLzVHa3dDRskexRoUtiWfxEEZrpnGIHJdahOLjorgzYJtIhCAXoDdN
         +NUGr6PHcKZdNqaAvXc25OCDVatxFA5JYhPWjS3P6Hiul3AsWzClzjlJwLYndxcYiX9K
         JOjA0k+//SCJcc7whw5XEyvjpGrtLGzm+Vnno8YgalqgzgSqCfX7gIEd31dCMBrXfLnB
         APxTJDnIXHpIL6v1Yy8Fe5unGJAi3tg53SBJPVLM6/qGdCsdlUDz8GHex+iycfgzQdE1
         nSCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679560725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y1cIEqXClsIkjDNlYez3V926czPhumNF8sofNyJFFdA=;
        b=0lbYOENcP2c6fC5uq810bmCRdN1fgrrkmiACt7V6C0FPzNbJ3zdaH/Zb6q8KYJP+gn
         0GSK1aLJ4RP+uDCHd2RG0STZ3sLNSk8ZoYVMWzzNwEOadseZ63eubYk6pVMTAxlCe89m
         YBY/88EEu4wRBBbGbmjh3yLrHnHSCwVMpyvdUH43QP1mWlMDbaoyqIzujmYPfeIuNso3
         SfRVmhM3jJ0livDPsJ/HaIpkJNou1J6jLGREFrnk7yhtIrNslexSFxUDwPKTDnq1/kB4
         CFYLEiluZ2IUu2b3QOdvPQoVb9Mp6ncCxkjbmy8k9Jd6S2V0e/NcYm4qtlOwQZT5uyZh
         f3Xg==
X-Gm-Message-State: AAQBX9eVDnKOEwxEQXMv/yS94VX9kh3T3LYFYnNcMxsbb0vqvaIF99EI
	0kXcB/X6QE0f935WbWuclpBUYqZxzmhfAXSx2VHdBA==
X-Google-Smtp-Source: AKy350YpQG1QeS/JHf1yz/+Mbi9pos/zlzsSJzy4Cm1WDOD9XB83zWfD4msAOPcBGwB9h63MVlcOeGakOFuzLin2Osw=
X-Received: by 2002:a81:b603:0:b0:545:883a:544d with SMTP id
 u3-20020a81b603000000b00545883a544dmr730788ywh.9.1679560725079; Thu, 23 Mar
 2023 01:38:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230323012929.10815-1-dipenp@nvidia.com> <20230323012929.10815-11-dipenp@nvidia.com>
In-Reply-To: <20230323012929.10815-11-dipenp@nvidia.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 23 Mar 2023 09:38:33 +0100
Message-ID: <CACRpkdapq1cR5id3K3zASprmUbTmh+QixyUEZFjNqYZPjWw2qw@mail.gmail.com>
Subject: Re: [PATCH V4 10/10] gpio: tegra186: Add Tegra234 hte support
To: Dipen Patel <dipenp@nvidia.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-doc@vger.kernel.org, robh+dt@kernel.org, timestamp@lists.linux.dev, 
	krzysztof.kozlowski+dt@linaro.org, brgl@bgdev.pl, corbet@lwn.net, 
	gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 23, 2023 at 2:29=E2=80=AFAM Dipen Patel <dipenp@nvidia.com> wro=
te:

> To enable timestamp support for the Tegra234, has_gte variable needs
> to be set true.
>
> Signed-off-by: Dipen Patel <dipenp@nvidia.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
