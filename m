Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5799E7C
	for <timestamp@lists.linux.dev>; Wed,  5 Apr 2023 02:24:40 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id d13so32541573pjh.0
        for <timestamp@lists.linux.dev>; Tue, 04 Apr 2023 19:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680661480;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9QNbM9lP47YBzDxJmWKWYEJzZC9ZIOjbZpNDsjzB1/E=;
        b=Xihw6CgZ9/9usz7a8VJsWY8rfqP+LOYjs7G3CCcJY+RprHUpGDw82g//kV+M/lN2eN
         MCKYQ+HhvY5W1cSsIACkXEtTwItPP3atD7PSnn6CY3edFU7fRlyEpyLbrZYs5XvWXdKy
         t9elDA+lhxpC06IPynnlGlvRp14mdfczCSvYnTbh9qn3oESdwAnGclujGnTFKq1PvYHe
         UNDDXArlN2SssUcwAIha7XxGo6wmqlEvq3mMQaulR81DCsd7RPPSH6PKtAexQR7gj6dj
         3c+zp0QURkwJcGXiXIAuMESlFidSs+6E6PbTvTKTDji9VpvU3LDj2Ttziz8wU064/qwl
         Zonw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680661480;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9QNbM9lP47YBzDxJmWKWYEJzZC9ZIOjbZpNDsjzB1/E=;
        b=AqNamj7K7QmhMg/HJcxF+X/rQkkCQNd11azouzev3nd20FJWXnocqqV7FxvKdywaJB
         m7V68nhqM9iBtUbzwAOtcJbesd4wXtJDbgmWf6tx4rANTQhLeGT62L2vtHKM+ucXDcmO
         sps1AnG4BNVFyEEF6P022N8BeBk4NonmK3TglD+pZ2EUhdUcyEKdaPZMGYPYw88q+9Rw
         Bk6A3ljK+QSKfNKLVS+GK6hNWhazs/+BUbwDmwWzHyC3PlWg66h4ttCBN4dbVP2q6fQ1
         WCuHtyNwzNiJVdfFVtflWg0P13aBDLH4km2Z1umkqtc1CsZO/Vp9geFC5briFSfXHa9o
         4COQ==
X-Gm-Message-State: AAQBX9cEkSB8mZEChbFXK4WFb9DT7l3D2lYlZDVOzkTMklhmDCVOGQ78
	uNJuux4NotPdmowGHkEHO4g=
X-Google-Smtp-Source: AKy350YC3ggg9qLvnDzmFothcUSjAQpi7xNqcwvsbbun0pCTYz8A4L5T/wFudH3EGQ7zlYXf1Kpd3g==
X-Received: by 2002:a05:6a20:659c:b0:da:c40:8dc with SMTP id p28-20020a056a20659c00b000da0c4008dcmr4172153pzh.6.1680661479619;
        Tue, 04 Apr 2023 19:24:39 -0700 (PDT)
Received: from [192.168.43.80] (subs02-180-214-232-18.three.co.id. [180.214.232.18])
        by smtp.gmail.com with ESMTPSA id x9-20020aa793a9000000b005898fcb7c1bsm9679454pff.177.2023.04.04.19.24.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Apr 2023 19:24:39 -0700 (PDT)
Message-ID: <364610b8-2c40-6a71-513e-4e154b077055@gmail.com>
Date: Wed, 5 Apr 2023 09:24:30 +0700
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH V4 06/10] hte: Re-phrase tegra API document
Content-Language: en-US
To: Dipen Patel <dipenp@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
 linus.walleij@linaro.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org, robh+dt@kernel.org, timestamp@lists.linux.dev,
 krzysztof.kozlowski+dt@linaro.org, brgl@bgdev.pl, corbet@lwn.net,
 gregkh@linuxfoundation.org
References: <20230323012929.10815-1-dipenp@nvidia.com>
 <20230323012929.10815-7-dipenp@nvidia.com>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <20230323012929.10815-7-dipenp@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/23/23 08:29, Dipen Patel wrote:
> Make Tegra194 API document generic to make it applicable for
> current and future tegra hte providers.
> 
> Signed-off-by: Dipen Patel <dipenp@nvidia.com>
> ---
>  Documentation/driver-api/hte/tegra194-hte.rst | 33 +++++++++----------
>  1 file changed, 16 insertions(+), 17 deletions(-)
> 

While generalizing the doc, the doc file name should also be renamed
(i.e. to tegra-hte.rst).

> diff --git a/Documentation/driver-api/hte/tegra194-hte.rst b/Documentation/driver-api/hte/tegra194-hte.rst
> index f2d617265546..85e654772782 100644
> --- a/Documentation/driver-api/hte/tegra194-hte.rst
> +++ b/Documentation/driver-api/hte/tegra194-hte.rst
> @@ -5,25 +5,25 @@ HTE Kernel provider driver
>  
>  Description
>  -----------
> -The Nvidia tegra194 HTE provider driver implements two GTE
> -(Generic Timestamping Engine) instances: 1) GPIO GTE and 2) LIC
> -(Legacy Interrupt Controller) IRQ GTE. Both GTE instances get the
> -timestamp from the system counter TSC which has 31.25MHz clock rate, and the
> -driver converts clock tick rate to nanoseconds before storing it as timestamp
> -value.
> +The Nvidia tegra HTE provider also known as GTE (Generic Timestamping Engine)
> +driver implements two GTE instances: 1) GPIO GTE and 2) LIC
> +(Legacy Interrupt Controller) IRQ GTE. Both GTE instances get the timestamp
> +from the system counter TSC which has 31.25MHz clock rate, and the driver
> +converts clock tick rate to nanoseconds before storing it as timestamp value.
>  
>  GPIO GTE
>  --------
>  
>  This GTE instance timestamps GPIO in real time. For that to happen GPIO
> -needs to be configured as input. The always on (AON) GPIO controller instance
> -supports timestamping GPIOs in real time and it has 39 GPIO lines. The GPIO GTE
> -and AON GPIO controller are tightly coupled as it requires very specific bits
> -to be set in GPIO config register before GPIO GTE can be used, for that GPIOLIB
> -adds two optional APIs as below. The GPIO GTE code supports both kernel
> -and userspace consumers. The kernel space consumers can directly talk to HTE
> -subsystem while userspace consumers timestamp requests go through GPIOLIB CDEV
> -framework to HTE subsystem.
> +needs to be configured as input. Only the always on (AON) GPIO controller
> +instance supports timestamping GPIOs in real time as it is tightly coupled with
> +the GPIO GTE. To support this, GPIOLIB adds two optional APIs as mentioned
> +below. The GPIO GTE code supports both kernel and userspace consumers. The
> +kernel space consumers can directly talk to HTE subsystem while userspace
> +consumers timestamp requests go through GPIOLIB CDEV framework to HTE
> +subsystem. The hte devicetree binding described at
> +``Documentation/devicetree/bindings/timestamp`` provides an example of how a
> +consumer can request an GPIO line.
>  
>  See gpiod_enable_hw_timestamp_ns() and gpiod_disable_hw_timestamp_ns().
>  
> @@ -34,9 +34,8 @@ returns the timestamp in nanoseconds.
>  LIC (Legacy Interrupt Controller) IRQ GTE
>  -----------------------------------------
>  
> -This GTE instance timestamps LIC IRQ lines in real time. There are 352 IRQ
> -lines which this instance can add timestamps to in real time. The hte
> -devicetree binding described at ``Documentation/devicetree/bindings/timestamp``
> +This GTE instance timestamps LIC IRQ lines in real time. The hte devicetree
> +binding described at ``Documentation/devicetree/bindings/timestamp``
>  provides an example of how a consumer can request an IRQ line. Since it is a
>  one-to-one mapping with IRQ GTE provider, consumers can simply specify the IRQ
>  number that they are interested in. There is no userspace consumer support for

The wording LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

-- 
An old man doll... just what I always wanted! - Clara

