Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497051C3A
	for <timestamp@lists.linux.dev>; Wed,  7 Jun 2023 07:40:41 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-973bf581759so1141012766b.0
        for <timestamp@lists.linux.dev>; Wed, 07 Jun 2023 00:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686123640; x=1688715640;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QzNzUxBgctT5U3+gB3td/wPDXx9tt+J9TkByw444vb4=;
        b=dpiv/lAao6jUqNRWIwDa/t6LO1tyPxkPWni1OUv3MwCcaBvBG9TZJWlQAsTwrpJG8z
         WiSLr3KTYWPNapPhFe4g/UQTjDvdv2Kh5m3vUHx2Uvn0qhMaWW7936pz4POvuJM/IQsq
         Nj5IuPvfSkJvvk2/lgKSqanZnlPWCLIWckttk5fd61hIvF0Cv5Sw1t5kE8iZvriviEW+
         In+gf5HZQY8yoXdiDm/zttqRTvXjVTxgNdcYNhuap4h3KffjSa1/I4wWvgR5nzhKYxNl
         ilEXGjb2B7MxuIK+KjltPks5gdQ0IXXIg2nLLmfmXMao4M6uuWPsgMMFy1+JhqAIHqER
         v4DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686123640; x=1688715640;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QzNzUxBgctT5U3+gB3td/wPDXx9tt+J9TkByw444vb4=;
        b=ljC8JHAeB297+saSWcKP2uDTIdSyeszTEve+yFYtWF4Xo62vGHWRzAjbe7Xwy9EH8B
         G4YqdkzXUFASytht2rPWUGCmWkRyl5w2ivIMdGw4VSsBKStbFo7d70h7gKiWc0/NvD6C
         AJtIKBFIJbIaIiOIslh1kv8L/5wvxJf78vE0mxpbeS71yS/N08d7K0s+9nfLSixVyCI0
         BdnaT2GgiT6OdRIaOF/rf7nCLWYVYtk19yr5ORnWtoKIm+ttAwtLbvUhqya1Ke+/f560
         zsBEic/XKThrYAGkSsDMrgOjyhOJx2sIpxw6+wYzukj4ooxJ4cLau9eU0eZMG4g62laR
         QAkw==
X-Gm-Message-State: AC+VfDzPfZzinyeFw1/yFZ1hEKHIGZx59W7hu3p3GE/XHetYjpVEu1UG
	0q+X36gL9or2By1wzeXOpD2Saw==
X-Google-Smtp-Source: ACHHUZ6nIjpeIRlx7fPahFZ5gzxmNl29452UMvG6AuY1y9w+PrjwLC4zGKqXZHhvW+xhYzrUW9v6Ug==
X-Received: by 2002:a17:907:9403:b0:965:cc76:7716 with SMTP id dk3-20020a170907940300b00965cc767716mr4912526ejc.76.1686123640173;
        Wed, 07 Jun 2023 00:40:40 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id k16-20020a1709065fd000b00977db7d08cbsm3376124ejv.74.2023.06.07.00.40.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 00:40:39 -0700 (PDT)
Message-ID: <f141a538-23b8-d10e-227c-5f0ad191c3a6@linaro.org>
Date: Wed, 7 Jun 2023 09:40:37 +0200
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 2/7] dt-bindings: pwm: restrict node name suffixes
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Mark Brown <broonie@kernel.org>, Dipen Patel <dipenp@nvidia.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Dilip Kota <eswara.kota@linux.intel.com>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-rtc@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-spi@vger.kernel.org, timestamp@lists.linux.dev,
 linux-watchdog@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Oleksij Rempel <o.rempel@pengutronix.de>
References: <20230530144851.92059-1-krzysztof.kozlowski@linaro.org>
 <20230530144851.92059-3-krzysztof.kozlowski@linaro.org>
 <20230607073652.hoyrernfcuoryrqs@pengutronix.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230607073652.hoyrernfcuoryrqs@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/06/2023 09:36, Uwe Kleine-König wrote:
> On Tue, May 30, 2023 at 04:48:46PM +0200, Krzysztof Kozlowski wrote:
>> Make the pattern matching node names a bit stricter to improve DTS
>> consistency.  The pattern is restricted to:
>> 1. Only one unit address or one -N suffix,
>> 2. -N suffixes to decimal numbers.
>>
>> Suggested-by: Rob Herring <robh@kernel.org>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
>>
>> ---
>>
>> Cc: Tony Lindgren <tony@atomide.com>
>> Cc: Oleksij Rempel <o.rempel@pengutronix.de>
>> ---
>>  Documentation/devicetree/bindings/pwm/pwm.yaml | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/pwm/pwm.yaml b/Documentation/devicetree/bindings/pwm/pwm.yaml
>> index 3c01f85029e5..abd9fa873354 100644
>> --- a/Documentation/devicetree/bindings/pwm/pwm.yaml
>> +++ b/Documentation/devicetree/bindings/pwm/pwm.yaml
>> @@ -13,7 +13,7 @@ select: false
>>  
>>  properties:
>>    $nodename:
>> -    pattern: "^pwm(@.*|-[0-9a-f])*$"
>> +    pattern: "^pwm(@.*|-([0-9]|[1-9][0-9]+))?$"
> 
> With this patch we forbid now the following patterns:
> 
> 	pwm-[0-9a-f][@-].*
> 	pwm-0[0-9a-f]+
> 	pwm-[a-f]([@-].*)?

Yes, this was discussed last time:
https://lore.kernel.org/all/20221127182232.GA128974-robh@kernel.org/

> 
> Checking for such names:
> 
> 	$ git grep -oP '\bpwm-([0-9a-f][@-].*|0[0-9a-f]+|[0-9]*[a-f][0-9a-f]*)(*pla:\s*\{)' arch/*/boot/dts
> 	arch/arm/boot/dts/meson8.dtsi:pwm-f-ao
> 	arch/arm/boot/dts/meson8.dtsi:pwm-e
> 	arch/arm/boot/dts/meson8b.dtsi:pwm-d
> 	arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:pwm-a
> 	arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:pwm-b-x7
> 	arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:pwm-b-x19
> 	arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:pwm-c-c
> 	arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:pwm-c-x5
> 	arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:pwm-c-x8
> 	arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:pwm-d-x3
> 	arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:pwm-d-x6
> 	arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:pwm-e
> 	arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:pwm-f-z
> 	arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:pwm-f-a
> 	arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:pwm-f-x
> 	arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:pwm-f-h
> 	arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:pwm-a-e

Are you sure these are pwms, not pins?

> 
> These are all pinmux-settings and no pwm nodes, so the change is fine.
> (But arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi isn't properly
> sorted alphabetically.)

Exactly...

> 
> Reviewed-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>


Best regards,
Krzysztof

