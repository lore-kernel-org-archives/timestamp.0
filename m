Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3175B20EE
	for <timestamp@lists.linux.dev>; Sat, 25 Mar 2023 11:06:06 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id ek18so17342134edb.6
        for <timestamp@lists.linux.dev>; Sat, 25 Mar 2023 04:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679742364;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kyJllvbXUI0QQOEow8J1KqOMI3Ya0GwTOdR2vNWkDWs=;
        b=ToqEBbhgy+Rx0IB00+BZl7MUtHd+MGQ06N0l4x7AyU/WnUQh6FieK/VSsvmAeS7BWi
         POuP5eEVcdO76IYIxZBNkkSIju5MG0rarkJzImWFquFNqCIsOV54GW/j6+dIMJlcewmV
         8/el+Fe3l9HtsepRw0TSaFQLV10QIJ1QkTrNMKJh3IhrfkoN4Cs0ccJVKRcIKeYmBhip
         psB5g1/JzkDJ7WywjLPGoHL+ZqiCFt6LikR8u+7UN5RSBA15zu6AOfiSCVxUk7UUUPP2
         ZsJ2wr2Tg/hSM3M9XoLF0oZW1koJD/Vt+KDG5xRFUez1kW/4pzR/ds7YBCyz6/YXSICQ
         6z0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679742364;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kyJllvbXUI0QQOEow8J1KqOMI3Ya0GwTOdR2vNWkDWs=;
        b=g4tMX2AW9/8b6gt9GXTXJ8oYGHs7jxKKMMo35Rl4oh3wmUf6v7P51Bs9GUi7Lu62Io
         6+8IGbx0Oc24k7eW4lbqZHj5fx3rpB4gAMtXXGM9FI79wPL0zSFp9lPKhhDhoamw4Gi7
         V3eRWAIr4CbXbG/XUuCex2sD9ssWbkaZDSOvmOEu6pfy62hXhPSCtyJ4zULzFb/q6Otm
         Etaj1+5jbbKUwxX/LTukuWrpaswjGEH14o6lU7cZ6p5lZzk4gcIpwCjgcOlP+PwONGGJ
         EnKiZocnnDOXiEiQvy2AFR7rMgxIAmwPYeHgMr2rwIS678XwqTwkO23ZmsiB+Qx7WLjb
         56iQ==
X-Gm-Message-State: AAQBX9f2fE3KcfR8iQphiaJlELN6Z9NdG1BrnYrBX7GJU6baaiZapjcm
	XNSfrcUhTwVG4i5QFaJJQ/OZMg==
X-Google-Smtp-Source: AKy350bjL1mTbRuR71X+ohrwa8Y+ia/HtAFdnaZuQhY/yojIi/PylgTif7WRDtiA1BrveZ7kYCA14w==
X-Received: by 2002:a17:906:e0c6:b0:93b:a133:f7e6 with SMTP id gl6-20020a170906e0c600b0093ba133f7e6mr5300187ejb.46.1679742364346;
        Sat, 25 Mar 2023 04:06:04 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d230:b2c7:d55:c9c8? ([2a02:810d:15c0:828:d230:b2c7:d55:c9c8])
        by smtp.gmail.com with ESMTPSA id v15-20020a170906858f00b0093229e527cdsm11163398ejx.42.2023.03.25.04.06.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Mar 2023 04:06:04 -0700 (PDT)
Message-ID: <b1d365f8-8ed8-3fe4-0feb-176d90eeccac@linaro.org>
Date: Sat, 25 Mar 2023 12:06:03 +0100
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH V4 02/10] dt-bindings: timestamp: Add Tegra234 support
Content-Language: en-US
To: Dipen Patel <dipenp@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
 linus.walleij@linaro.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org, robh+dt@kernel.org, timestamp@lists.linux.dev,
 krzysztof.kozlowski+dt@linaro.org, brgl@bgdev.pl, corbet@lwn.net,
 gregkh@linuxfoundation.org
References: <20230323012929.10815-1-dipenp@nvidia.com>
 <20230323012929.10815-3-dipenp@nvidia.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230323012929.10815-3-dipenp@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/03/2023 02:29, Dipen Patel wrote:
> Added timestamp provider support for the Tegra234 in devicetree
> bindings.
> 
> Signed-off-by: Dipen Patel <dipenp@nvidia.com>
> ---
> v2:
> - Removed nvidia,slices property
> - Added nvidia,gpio-controller based on review comments from Thierry,
>   this will help simplify the  hte provider driver.
> 
> v3:
> - Explained changes in detail in commit message
> - Added allOf section per review comment
> 
> v4:
> - Logically divide the v3 patch as follows
> - Created Tegra234 support patch
> - Created depracate nvidia,slices property patch
> - Created addition of the nvidia,gpio-controller property patch
> 
>  .../timestamp/nvidia,tegra194-hte.yaml        | 44 +++++++++++++++++--
>  1 file changed, 40 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/timestamp/nvidia,tegra194-hte.yaml b/Documentation/devicetree/bindings/timestamp/nvidia,tegra194-hte.yaml
> index c31e207d1652..158dbe58c49f 100644
> --- a/Documentation/devicetree/bindings/timestamp/nvidia,tegra194-hte.yaml
> +++ b/Documentation/devicetree/bindings/timestamp/nvidia,tegra194-hte.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/timestamp/nvidia,tegra194-hte.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Tegra194 on chip generic hardware timestamping engine (HTE)
> +title: Tegra on chip generic hardware timestamping engine (HTE) provider
>  
>  maintainers:
>    - Dipen Patel <dipenp@nvidia.com>
> @@ -23,6 +23,8 @@ properties:
>      enum:
>        - nvidia,tegra194-gte-aon
>        - nvidia,tegra194-gte-lic
> +      - nvidia,tegra234-gte-aon
> +      - nvidia,tegra234-gte-lic
>  
>    reg:
>      maxItems: 1
> @@ -43,9 +45,8 @@ properties:
>      description:
>        HTE lines are arranged in 32 bit slice where each bit represents different
>        line/signal that it can enable/configure for the timestamp. It is u32
> -      property and depends on the HTE instance in the chip. The value 3 is for
> -      GPIO GTE and 11 for IRQ GTE.
> -    enum: [3, 11]
> +      property and the value depends on the HTE instance in the chip.
> +    enum: [3, 11, 17]
>  
>    '#timestamp-cells':
>      description:
> @@ -55,6 +56,41 @@ properties:
>        mentioned in the nvidia GPIO device tree binding document.
>      const: 1
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - nvidia,tegra194-gte-aon
> +              - nvidia,tegra234-gte-aon
> +    then:
> +      properties:
> +        nvidia,slices:
> +          const: 3
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - nvidia,tegra194-gte-lic
> +    then:
> +      properties:
> +        nvidia,slices:
> +          const: 11
> +

... and looking at your next patch - unreviewed...

Best regards,
Krzysztof

