Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AA71F3FFD
	for <timestamp@lists.linux.dev>; Tue, 21 Jan 2025 17:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737481519; cv=none; b=su1fRNXM5mpGwQVRX/VzaqQD3ubZg/8T+FV3g7spOhHHVJ371douW8lkGO0dqOFo/zJSzrn5/gxVdj5SDFusQv/7YKfiHkdhxdQfl/9To1HFyVuQFAoZ0BKhXydsGX6Vg+9ATfMc74gReJqNMZ9SREqhc1aBuSOPXt4u9MovIEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737481519; c=relaxed/simple;
	bh=qW7lgtx1NXRyO4nNtRrfa7jbD7BqM70uxiOODd0SynA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NW+2FSUEjx4iRtUStnMsGXKUCvQwAvyaoUqzTievKtpF/GpW58Tk8X7H8TPxVpWJUYP8ljHjvpa4py/4YgVTwjXiU9d/XUNeEctdIcHW+c0tFMCo+ybruvQXa0IjJZbBoZvkWbMeSLH8WbBHN4qv339TTlv10xhvCX786Ts25gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ucKbY6i2; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ucKbY6i2"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-29fad34bb62so3350207fac.1
        for <timestamp@lists.linux.dev>; Tue, 21 Jan 2025 09:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1737481516; x=1738086316; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gFPlf0fcfXdm2Ps7qwcaDy5IkXbtJsI7nT9CQInAONs=;
        b=ucKbY6i2LAQfreNSsHgWHdOXvMwlsjjwOlDAGFVc63l2qPIT8HlT8ASdtRuoVX3Yb3
         mTnagI07rjSmqiBYZJ74z7zgr69yMEersATr85YLDV7Bewc1pfqYeA3Q7UxdYKvskslr
         suerTnfKf2d3HU4OPTpehtl4Usj59gxQ3K+iG/2SLrM/E9IGlnW2Pev6QOBPMhBeuhkK
         KHSinRwPejzrNWLKJ+0XeHKZxVWJ1crYjzmCO6JrJ/J3q1QGaUSSgqtAQlz5U5P3vNoI
         SM58WHpM8UBhBzAEDn8JOoO1wEsstWPNxFs7GhYrOWnBkKWEnLCU+TAYISAIG754tHP8
         SHfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737481516; x=1738086316;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gFPlf0fcfXdm2Ps7qwcaDy5IkXbtJsI7nT9CQInAONs=;
        b=MgmVwLSXbqBtN4+iW208tbPi7FSLor1w7eSddtZhFlWi+RSJ5N4NVqGtQeZVwBDzIN
         zqRBaCTWw+fuPpfLekruEVgc82Mu8Kz0qPYT0B5r2yvL8ik6xcI1hK22i3qNXOuxyxnX
         sP3A9L/RQI8T7Yv/Ya252D6qJtFrxtwWWQrXM5ulK14f4Js6y2TizHj1D/brxINQ2PbB
         /XT9RuJGJx7eyJuxYIsFaiROi4uaPuifGKhd1Wk43EZ/tWbQD+IP09u6D75TBHNwJTux
         Mmct0iEHFYAvGQaWyXsSTOlkX4ad4xgIfAvFF/tcUF8vZVWinnVyf/DJ/jTu6H/BLHfU
         y19Q==
X-Forwarded-Encrypted: i=1; AJvYcCWZ7/OkU1rdd2WE2E+Mz156zDcZEFU6i0iqx2p+ZkJdDPIlSHYFYddVjd6+lJkFqQ81wPuXpOja9PU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzfCwM+fgs9ihnR7dVlaCNtgYWWZ74k+I/+6W8dsR4/D/+NU8FL
	Hg4Ih9dYeXem7xrNa039fInmN0xPVKfQrtnQLtxEO14YADKXGT0O6uNWTOktiDE=
X-Gm-Gg: ASbGncvXs+L4XPcPwPA6aoqw7y93JVCnngpWjKoCWnME1Lumxq4rENrB4mM99ogODDN
	E2O8mdO2wphUTnUoY+UWTonDw7h45w+5jkwykFhXHdpiYZ4eRMVZDXMfj2W5iQtHM9Fwymk8GX8
	DE5RPeoC9rsksq86U8vMlO4yTxHF3AaheHlVozRNgOWvq4odwB/DsFJn2GPt0PkIiD9r6jD8bnK
	VxeKuJs/20s0Prtr1PmPCxjhdkAuTTEdUAb62+JMqPhZutjCtLCNCaAofAiITRclJU9TT1XCWQt
	K7rNu6aCDXfDSRKgslR162Da7byTZWA=
X-Google-Smtp-Source: AGHT+IEgfdprwgucyNPXv304ky4DmwpyYonBJIkMSm1CRqaY5wyRbrLL3xmGRG3yr6mliYkwxF1ugg==
X-Received: by 2002:a05:6871:a4c7:b0:29e:6814:19d with SMTP id 586e51a60fabf-2b1c0a0b434mr10780536fac.9.1737481516103;
        Tue, 21 Jan 2025 09:45:16 -0800 (PST)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2b1b8c8ac66sm3806278fac.8.2025.01.21.09.45.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 09:45:15 -0800 (PST)
Message-ID: <ed41d313-b918-4c55-966e-10cc8a2e6b18@baylibre.com>
Date: Tue, 21 Jan 2025 11:45:14 -0600
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Q] Frequency & duty cycle measurement?
To: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>,
 linux-iio@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, timestamp@lists.linux.dev
Cc: William Breathitt Gray <wbg@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Dipen Patel <dipenp@nvidia.com>
References: <f2ec8a55-42ad-498a-b793-072444dcb92e@prolan.hu>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <f2ec8a55-42ad-498a-b793-072444dcb92e@prolan.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 1/21/25 9:19 AM, Csókás Bence wrote:
> Hi all,
> 
> we want to measure the frequency and duty cycle of a signal (relating to power consumption) using a hardware timer in our SoC (Microchip SAMA5D2). The hardware is capable of taking a snapshot of the timer value into another dedicated register pair (RA, RB) on the rising/falling edges, and a small `devmem`-based userspace utility was created as a working PoC. Now we want to move to a "proper" kernelspace solution.
> 
> However, none of the existing drivers seem to be able to do this; the closest was `drivers/counter/microchip-tcb-capture.c`, but that only seems to count one type of edge (rising/falling), and cannot give us the time between them, which would be needed for duty cycle calculation. The only other driver I could find was `drivers/clocksource/timer-atmel-tcb.c`, which again seems incapable of such measurements. Therefore, a new module will probably be needed; the question then becomes: which API to implement.
> 
> As `microchip-tcb-capture.c` uses the Generic Counter Interface, that was obviously a first stop. However, from what I could see, you can only represent (1) the number of times an edge has been encountered, and (2) rotary encodings (quadrature and direction-step decoders); and not the time between edges.

You might find some interesting reading at [1]. A few years ago, I started
adding support for an "edge capture unit" and timer on the TI EQEP quadrature
encoder driver in the counter subsystem. I never found time to keep working on
that to get it merged, but I've actually been looking at it again just last
week. It sounds quite similar, but I didn't consider the possibility of looking
at the duty cycle, only the rate.

[1]: https://lore.kernel.org/linux-iio/20211017013343.3385923-1-david@lechnology.com/

> 
> IIO_ALTVOLTAGE and IIO_CHAN_INFO_FREQUENCY/_PHASE also seemed promising (although the lack of IIO_CHAN_INFO_DUTY_CYCLE already posed a problem), until I saw that all current drivers are frequency *generators*, and not measurers, the latter seems to be completely unimplemented.

A similar case came up somewhat recently [2] where it was suggested to add
IIO_FREQUENCY to be able to measure a clock frequency [3].

[2]: https://lore.kernel.org/linux-iio/20240624173105.909554-1-jbrunet@baylibre.com/
[3]: https://lore.kernel.org/linux-iio/20240629204025.683b1b69@jic23-huawei/
> 
> The only other contender I could find was the Hardware Timestamping Engine (HTE), but again, it's not clear whether (1) the API is even capable of relaying duty cycle information to userspace and (2) if it is, how would one go about implementing it.
> 
> It is also entirely possible I missed a driver or API that could handle this better, if so, please don't keep it to yourselves.

In the PWM subsystem, there is pwm_capture() which allows measuring period and
duty cycle, so could be exactly what you are looking for.

> 
> So, how could one go about implementing such a driver?
> 
> Bence
> 
> 


