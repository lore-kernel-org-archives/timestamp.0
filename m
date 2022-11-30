Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491B07C
	for <timestamp@lists.linux.dev>; Wed, 30 Nov 2022 03:43:54 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id p24so11679148plw.1
        for <timestamp@lists.linux.dev>; Tue, 29 Nov 2022 19:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q2iyrgtYDuQKt/kE7+C53HCWQJvUcvpFAzkZEkz/5Fk=;
        b=arIafAEMNCqxxUJ6A8NnFQ1SoS9OnNxJfCm0VwcbDkv2lL2Clx8ewRYqQsEHNp6a+o
         CWy6BkJol8zZo2XRRAyqSsvf5qmIeI/AYSnXJhIjd2RNSR8SuUJ1FIqXt39e0SQUeyO+
         RT5BZkQDKd+UFdqHgmSCYtLUsznQf7QB2LtRgvf7qDNiUFraKaCt6M411grsfG0EzdkZ
         L+c7FpPe/3jlZGh9TFsb6lzm5b4IUNm0T4z6mNmVIu4JSZ/wI8HTn0X7MI89GIQNxtf8
         xUjGICCQmMJToDxY9Fyym4SGqZIQjjf0hhCq6OdC1olzrhM4MI6P5gCO7PILN3o/2htV
         6UZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q2iyrgtYDuQKt/kE7+C53HCWQJvUcvpFAzkZEkz/5Fk=;
        b=3TF6x70tz31WaK8nlkzqxjfMnHTxvRS9bjp+mxitkdNnTXNoF8qHql3JhPK4OMDRVc
         V8zTxi4OEZepZEu8hnlR1QGfMxks9I4Oku/k5Z+tlhxCps0+lOJIOsGvgKJTq8MQp10q
         nkrwKSgnhEzOyz/VFv278JQAiuxRznzgVFILA/UNcR1X3hOn/3DjxKTSH9x7V0Wb3gNU
         hvYWI7cnTfgNjhfuH9Rk+fDkMENlr8ncdJ+VADiX5W1gDljN2LBEdwtasnoVaF9NgxIj
         QbpDcNPYYeW7Q3NhVpvlWI5K7LmLV0AkK0MODPiqxLMbOUNf0mP3Kg1cCWTp3SOZc9Xx
         fcYw==
X-Gm-Message-State: ANoB5pkDuZX5PcuMhgBeho8bsYmi4lP3zcllaAWJBQKONW/XrJ+Gh6LN
	qX2zVseEpm2w9TcSVreCkMY=
X-Google-Smtp-Source: AA0mqf6RgG4UbvdUAsdQcRV2TiZBLISWyGOQCPavRvxQ949guJf0YWnsneE94lxtpEV8RpHBZcMBHQ==
X-Received: by 2002:a17:902:7d89:b0:188:4ba9:79ee with SMTP id a9-20020a1709027d8900b001884ba979eemr40717697plm.83.1669779833723;
        Tue, 29 Nov 2022 19:43:53 -0800 (PST)
Received: from [192.168.43.80] (subs32-116-206-28-61.three.co.id. [116.206.28.61])
        by smtp.gmail.com with ESMTPSA id j6-20020a170903028600b00189758e2babsm88850plr.125.2022.11.29.19.43.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Nov 2022 19:43:53 -0800 (PST)
Message-ID: <d6f53bbc-34b9-dcef-b37f-d4babb8b7a4d@gmail.com>
Date: Wed, 30 Nov 2022 10:43:47 +0700
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 5/7] hte: Re-phrase tegra API document
Content-Language: en-US
To: Dipen Patel <dipenp@nvidia.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-gpio@vger.kernel.org, linus.walleij@linaro.org,
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org, robh+dt@kernel.org,
 timestamp@lists.linux.dev
References: <20221103174523.29592-1-dipenp@nvidia.com>
 <20221103174523.29592-6-dipenp@nvidia.com> <Y2XZj4j/NQH2igvJ@debian.me>
 <5145d9d3-d3ae-e95a-6583-803f31d6d9b7@nvidia.com>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <5145d9d3-d3ae-e95a-6583-803f31d6d9b7@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/30/22 10:34, Dipen Patel wrote:
>> I think the wording can be better:
> I do  not understand, can you please elaborate?

Exactly where? Please quote appropriate hunks from below where do you not
understand.

>>
>> ---- >8 ----
>>
>> diff --git a/Documentation/driver-api/hte/tegra194-hte.rst b/Documentation/driver-api/hte/tegra194-hte.rst
>> index 85e654772782c1..13c45bfc03a75e 100644
>> --- a/Documentation/driver-api/hte/tegra194-hte.rst
>> +++ b/Documentation/driver-api/hte/tegra194-hte.rst
>> @@ -5,11 +5,11 @@ HTE Kernel provider driver
>>  
>>  Description
>>  -----------
>> -The Nvidia tegra HTE provider also known as GTE (Generic Timestamping Engine)
>> -driver implements two GTE instances: 1) GPIO GTE and 2) LIC
>> -(Legacy Interrupt Controller) IRQ GTE. Both GTE instances get the timestamp
>> -from the system counter TSC which has 31.25MHz clock rate, and the driver
>> -converts clock tick rate to nanoseconds before storing it as timestamp value.
>> +The Nvidia tegra HTE provider, also known as GTE (Generic Timestamping Engine)
>> +driver implements two GTE instances: GPIO GTE and LIC (Legacy Interrupt
>> +Controller) IRQ GTE. Both GTE instances get the timestamp from system counter
>> +TSC which has 31.25MHz clock rate, and the driver converts clock tick rate to
>> +nanoseconds before storing it as timestamp value.
>>  
>>  GPIO GTE
>>  --------
>> @@ -19,17 +19,17 @@ needs to be configured as input. Only the always on (AON) GPIO controller
>>  instance supports timestamping GPIOs in real time as it is tightly coupled with
>>  the GPIO GTE. To support this, GPIOLIB adds two optional APIs as mentioned
>>  below. The GPIO GTE code supports both kernel and userspace consumers. The
>> -kernel space consumers can directly talk to HTE subsystem while userspace
>> -consumers timestamp requests go through GPIOLIB CDEV framework to HTE
>> -subsystem. The hte devicetree binding described at
>> -``Documentation/devicetree/bindings/timestamp`` provides an example of how a
>> -consumer can request an GPIO line.
>> +kernel space consumers can directly talk to HTE subsystem while requests from
>> +userspace consumers go through GPIOLIB CDEV framework to HTE subsystem. The hte
>> +devicetree binding described at ``Documentation/devicetree/bindings/timestamp``
>> +provides an example of how a consumer can request an GPIO line.
>>  
>> -See gpiod_enable_hw_timestamp_ns() and gpiod_disable_hw_timestamp_ns().
>> +To toggle hardware timestamp, use gpiod_enable_hw_timestamp_ns() and
>> +gpiod_disable_hw_timestamp_ns().
>>  
>>  For userspace consumers, GPIO_V2_LINE_FLAG_EVENT_CLOCK_HTE flag must be
>> -specified during IOCTL calls. Refer to ``tools/gpio/gpio-event-mon.c``, which
>> -returns the timestamp in nanoseconds.
>> +specified during IOCTL calls. Refer to ``tools/gpio/gpio-event-mon.c`` for
>> +example.
>>  
>>  LIC (Legacy Interrupt Controller) IRQ GTE
>>  -----------------------------------------
>>

Thanks anyway.

-- 
An old man doll... just what I always wanted! - Clara

