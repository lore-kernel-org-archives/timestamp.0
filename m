Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E36320A
	for <timestamp@lists.linux.dev>; Thu, 23 Mar 2023 08:34:26 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-5447d217bc6so382606437b3.7
        for <timestamp@lists.linux.dev>; Thu, 23 Mar 2023 01:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679560465;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J4RYoPJ1LErLnjfKLVajCu6GU5STQHSZ9DUFEBKc2Ss=;
        b=GrRWMTpR78EiK4AGRh+wmlmCJc3yCLkLpH/UHF4e9cGS6u0ubEfnOhxJ/TlOwky0s8
         WB6++T3F+9k6IZ4E6+AnMDkgBvTHjHkZssw2T5snvgHlVXVPzEJ6Lhy0yxo616B3KUTU
         7XXdpc6YcBqJoe2ZM6oL5xe8PYDGY+d8y/Xt5QMGsideAAPUH7yrMGJrZrmRx5+uzFon
         jgdS8g/ujPnYr53RqC/hbmGIU9ZTPYW4D9iIrTFbAxBWC/Tkxy1GXf52JO1bIRBLV35U
         wd0qCFxzRzWpV6lqBEIAUjokdAC1KQf8QK7ezjT3lAgU8GP3x/f/kbyhwAIVnwj0lwNL
         MzNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679560465;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J4RYoPJ1LErLnjfKLVajCu6GU5STQHSZ9DUFEBKc2Ss=;
        b=25f6uDh0nFX56fBwhBGejikWSannvs/IA5yrc/3IXXq9jhTPHu9FpvvZVwF67mW6wl
         CyB5J6dmfKf9eGo7sGnICATUxI6vE/I012ZEanaQdat77JoGfrpgu3BRNfCAQzO8otIS
         Quzw2UnDouwCCJ9NJOTTawib04fzZ6DKzNMzLzqfCnUnbpMaLm4jusSiaRIAGEOq4gM8
         VQK+3c46tinFgM0pqxvI8pLRBfD07Ywq4UewoSjGkVBsis5/J7rQZTHGhRFF9UZieKMu
         R9oB+k4xSgOJ6B5p39KwhWNwW0Da4MhtkJ4QARx1L7OLEqiV2t5i0ZKp1/TCKE73hBeT
         /vEQ==
X-Gm-Message-State: AAQBX9dK9UqTscBtbv+Ir27Z4UEF1GMhitJGdJvN9xSsh+u6FLeK/Qgl
	2dUinx6YzVVSSppOfYksh9Kryqulhm5IXPnLX//V6A==
X-Google-Smtp-Source: AKy350ZaGM1U6Ub4iMxUNlQn/D6/CcT7QXGB3nXKmuAYzeKKqb6dW4NRFfS7v1XCoePQnsn6MuXULcyXhrBnNby8wqc=
X-Received: by 2002:a81:bd11:0:b0:532:e887:2c23 with SMTP id
 b17-20020a81bd11000000b00532e8872c23mr1431390ywi.9.1679560465580; Thu, 23 Mar
 2023 01:34:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230323012929.10815-1-dipenp@nvidia.com> <20230323012929.10815-4-dipenp@nvidia.com>
In-Reply-To: <20230323012929.10815-4-dipenp@nvidia.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 23 Mar 2023 09:34:14 +0100
Message-ID: <CACRpkdbPSyQbe8pC8EzhyGoVor+piaKRCoXLfoW_n_9JyYLu1g@mail.gmail.com>
Subject: Re: [PATCH V4 03/10] dt-bindings: timestamp: Deprecate nvidia,slices property
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

> The property is not necessary as it is a constant value and can be
> hardcoded in the driver code.
>
> Signed-off-by: Dipen Patel <dipenp@nvidia.com>

Looks completely reasonable to me!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
