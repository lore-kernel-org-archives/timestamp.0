Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784458C17
	for <timestamp@lists.linux.dev>; Mon, 13 Mar 2023 21:57:40 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5445009c26bso42889097b3.8
        for <timestamp@lists.linux.dev>; Mon, 13 Mar 2023 14:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678744659;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=amuk1a8QJGQKUxtyDQZC4FM9pz93ZMG/0KEcjg0E1UA=;
        b=O34j7Xta6RjeUG7qu9Jk2SaT74AKTuB75yqTIwvbdXJDotHjytsrU4177cwsoGq2lt
         VcDKThhaDkyHxh2px73H7aXksVMytfUwKAVFbSg+DUAoeWkl/66rsMG5vCdZarV+67Sm
         uX07By0fNcxu71yB7AucRzbCk1eSlamG7ds5Dqpmww+KSQ/U/xP3fwNe94IPO+poo7qA
         Sv9ZsH/4S2nzbCqN8kYIoZFq/S5rX4OkdWVzXS2ViUkwokiF+S5d4Jfj2GlE8D0dC+Lz
         dJMTBSvD/uigLSY5riqc0HcpBr0Fxx/6s7kwJT/Y3P1EO6DWocTzCvVQBxNtNfRQ1D1U
         NssA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678744659;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=amuk1a8QJGQKUxtyDQZC4FM9pz93ZMG/0KEcjg0E1UA=;
        b=z3DZ1C9fcEI5wiSK2YLpJTkVaphx/Y3J5wJodaKA8xaKl16RUkHoJMOsXczvL0EeWN
         qnjmP0/99rTzkpO80gU+cZTGFSXZwcxDoaOOHBL9i/xcpc1q8HSAQhjU6loKM5L3csND
         LZOzRpWh6hNelKu4XaZvfpy7lqrMeEk3YrqL+ngDjfeO9Y6ww3UV6cWclOCBlxFiNRED
         VJPJJfwbyemdfDK4GmRVN0/bTT/g169goYbfyY2VapvAo/THITaD0Z9h4Hu9E/0LS+6k
         1oaXZyUTvpUMfRz4ci0C1EqrBpJpG6nwGOptrA1fe+E9lLgJQRQ35axLKysH5gIiKhQg
         LMPA==
X-Gm-Message-State: AO0yUKWBfWQ0B8RpEtaiOckM+ZZKksFMsA+cqYtfjic5LINLKT5V00XS
	gT8QGueGbBi8bBx4C/6IUfhCV89QvpPlwymlkPVuag==
X-Google-Smtp-Source: AK7set86KxSVTf43Z5xxBccoEu4aIgx/5QqIi/mCylwIRT9EOGgS1qWtl7k5ozzRyBkcgozrGasSrkeNqxKoojdFi1g=
X-Received: by 2002:a81:b10a:0:b0:53d:2772:65d with SMTP id
 p10-20020a81b10a000000b0053d2772065dmr17609048ywh.9.1678744659416; Mon, 13
 Mar 2023 14:57:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230310190634.5053-1-dipenp@nvidia.com> <20230310190634.5053-3-dipenp@nvidia.com>
In-Reply-To: <20230310190634.5053-3-dipenp@nvidia.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Mar 2023 22:57:28 +0100
Message-ID: <CACRpkdYmC=eLiWPPPRG7DYBmQfPNCN4pcDhzTCO=hkQDx2HoGw@mail.gmail.com>
Subject: Re: [PATCH V3 2/6] dt-bindings: timestamp: Add Tegra234 support
To: Dipen Patel <dipenp@nvidia.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-doc@vger.kernel.org, robh+dt@kernel.org, timestamp@lists.linux.dev, 
	krzysztof.kozlowski+dt@linaro.org, brgl@bgdev.pl, corbet@lwn.net, 
	gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dipen,

thanks for maintaining HTE!

On Fri, Mar 10, 2023 at 8:06=E2=80=AFPM Dipen Patel <dipenp@nvidia.com> wro=
te:

> -  nvidia,slices:
> -     $ref: /schemas/types.yaml#/definitions/uint32

I would not delete this, just mark it deprecated.

nvidia,slices:
    $ref: /schemas/types.yaml#/definitions/uint32
    deprecated: true

(And remove it from required, of course)

This way you do not need to explain about why it was
deleted, it's just deprecated, which is fine.

Yours,
Linus Walleij
